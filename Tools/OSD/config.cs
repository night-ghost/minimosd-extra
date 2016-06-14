using System;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ArdupilotMega;
using System.Runtime.InteropServices;
using System.Collections.Specialized;

namespace OSD {
    using uint16_t = System.UInt16;
    using uint8_t = System.Byte;
    using int8_t = System.SByte;
    using boolean = System.Byte;

    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct Flags { // 4 bytes
        /*		
                определения флагов в constants.cs
        */
        internal Int32 flags4;


        public bool this[int index] { //вот как раз  get и set
            get {
                int mask = 1 << index;
                return (this.flags4 & mask) != 0;
            }
            set {
                int mask = 1 << index;
                if (value)
                    this.flags4 |= mask;
                else
                    this.flags4 &= ~mask;
            }
        }

    };


    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public unsafe struct Settings {

        internal byte model_type;
        internal byte ch_toggle;
        internal byte OSD_BRIGHTNESS;
        internal byte overspeed;

        internal byte stall;
        internal byte battv;
        internal byte switch_mode;		// режим переключения: 0 значение, 1 по кругу
        internal byte auto_screen_switch;

        internal byte OSD_RSSI_HIGH;
        internal byte OSD_RSSI_LOW;
        internal byte OSD_RSSI_RAW;
        internal byte OSD_BATT_WARN;

        internal byte OSD_RSSI_WARN;


        internal fixed byte _OSD_CALL_SIGN[Config.OSD_CALL_SIGN_TOTAL + 1];

        internal byte CHK1_VERSION;
        internal byte CHK2_VERSION;

        // версия прошивки и символов, для отображения в конфигураторе
        internal fixed byte _FW_VERSION[3];
        internal fixed byte _CS_VERSION[3];

        // новые настройки!


        //// коэффициенты внешних измерений
        internal float evBattA_koef;
        internal float evBattB_koef;
        internal float eCurrent_koef;
        internal float eRSSI_koef;

        // коэффициенты горизонта
        internal float horiz_kRoll;
        internal float horiz_kPitch;

        internal float horiz_kRoll_a; // коэффициенты горизонта для NTSC
        internal float horiz_kPitch_a;

        internal byte battBv;

        internal byte vert_offs; // сдвиг экрана по вертикали и горизонтали
        internal byte horiz_offs;
        // трансляция PWM на внешний вывод
        internal byte pwm_src;
        internal byte pwm_dst;

        internal byte n_screens;
        internal uint16_t RSSI_16_low;
        internal uint16_t RSSI_16_high;

    };

    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public unsafe struct Sensors {
        internal float sensor_K1; // коэффициенты сенсоров         
        internal float sensor_A1; // добавка сенсоров  
        internal fixed byte format1[Config.OSD_SENSOR_FORMAT_TOTAL + 1]; // формат печати
        
        internal float sensor_K2;
        internal float sensor_A2; 
        internal fixed byte format2[Config.OSD_SENSOR_FORMAT_TOTAL + 1];
        
        internal float sensor_K3;
        internal float sensor_A3; 
        internal fixed byte format3[Config.OSD_SENSOR_FORMAT_TOTAL + 1];

        internal float sensor_K4;
        internal float sensor_A4; 
        internal fixed byte format4[Config.OSD_SENSOR_FORMAT_TOTAL + 1];
    };

    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public unsafe struct Strings {
        internal fixed byte str[256];        
    };


    [StructLayout(LayoutKind.Explicit)]
    internal unsafe struct EEPROM {
        [FieldOffset(0)]
        internal fixed byte _data[Config.EEPROM_SIZE]; // сырые данные
        // обращение к настройкам панелей по смещению

        // битовые флаги
        [FieldOffset(OSD.Settings_offset)] // 512 - 4 экрана по 128, остальное для настроек
        internal Flags flags;
        // прочие настройки
        [FieldOffset(OSD.Settings_offset + 4)]
        internal Settings sets;

        [FieldOffset(OSD.Settings_offset + 128)]        
        internal Sensors sensors;


        [FieldOffset(OSD.Settings_offset + Config.Settings_size )]
        internal Strings strs;

        // чтение-запись всего массива
        public byte[] data {
            get {
                byte[] bb = new byte[Config.EEPROM_SIZE];

                fixed (EEPROM* p = &this) {
                    for (int bp = 0; bp < Config.EEPROM_SIZE; bp++)
                        bb[bp] = p->_data[bp];
                }
                return bb;

            }
            set {
                fixed (EEPROM* p = &this) {
                    for (int bp = 0; bp < Config.EEPROM_SIZE && bp < value.Length; bp++)
                        p->_data[bp] = value[bp];

                }
            }
        }

        // чтение-запись побайтно
        public byte this[int index] { //вот как раз  get и set
            get {
                fixed (EEPROM* p = &this)
                    return p->_data[index];
            }
            set {
                fixed (EEPROM* p = &this)
                    p->_data[index] = value;

            }
        }

        // обработки для фиксированных массивов, непригодных к прямому чтению
        public string osd_call_sign {
            get {
                string s = "";
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < Config.OSD_CALL_SIGN_TOTAL; i++) {
                        s += Convert.ToChar(p->_OSD_CALL_SIGN[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < Config.OSD_CALL_SIGN_TOTAL + 1; i++) {
                        p->_OSD_CALL_SIGN[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < Config.OSD_CALL_SIGN_TOTAL; i++) {
                        p->_OSD_CALL_SIGN[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

        public string FW_version {
            get {
                string s = "";
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < 3; i++) {
                        s += Convert.ToChar(p->_FW_VERSION[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < 3; i++) {
                        p->_FW_VERSION[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < 3; i++) {
                        p->_FW_VERSION[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

        public string CS_version {
            get {
                string s = "";
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < 3; i++) {
                        s += Convert.ToChar(p->_CS_VERSION[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < 3; i++) {
                        p->_CS_VERSION[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < 3; i++) {
                        p->_CS_VERSION[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }


        public string get_fixed(byte *ptr, int size) {

                string s = "";
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < size; i++) {
                        s += Convert.ToChar(ptr[i]);
                    }
                }
                return s;

        }
        

        public void set_fixed(byte *ptr, int size, string s) {
                fixed (Settings* p = &(this.sets)) {
                    for (int i = 0; i < size; i++) {
                        ptr[i] = 0;
                    }
                    for (int i = 0; i < s.Length && i < size; i++) {
                        ptr[i] = Convert.ToByte(s[i]);
                    }
                }
           
        }

       public string format1 {
            get {
                string s = "";
                fixed (Sensors * p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        s += Convert.ToChar(p->format1[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL + 1; i++) {
                        p->format1[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        p->format1[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

       public string format2 {
            get {
                string s = "";
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        s += Convert.ToChar(p->format2[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL + 1; i++) {
                        p->format2[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        p->format2[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

       public string format3 {
            get {
                string s = "";
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        s += Convert.ToChar(p->format3[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL + 1; i++) {
                        p->format3[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        p->format3[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

       public string format4 {
            get {
                string s = "";
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        s += Convert.ToChar(p->format4[i]);
                    }
                }
                return s;

            }
            set {
                fixed (Sensors* p = &(this.sensors)) {
                    for (int i = 0; i < Config.OSD_SENSOR_FORMAT_TOTAL + 1; i++) {
                        p->format4[i] = 0;
                    }
                    for (int i = 0; i < value.Length && i < Config.OSD_SENSOR_FORMAT_TOTAL; i++) {
                        p->format4[i] = Convert.ToByte(value[i]);
                    }
                }
            }
        }

       public string[] strings {
           get {
               string[] ss=new string[128];
               string s = "";
               int n=0;
               fixed (Strings * p = &(this.strs)) {
                   for (int i = 0; i < Config.Strings_size && n<128 ; i++) {
                       byte b = p->str[i];
                       if(b!=0 && b!=255)
                            s += Convert.ToChar(b);
                       else {
                            ss[n++]=s;
                            s="";
                       }
                   }
               }
               return ss;

           }
           set {
               fixed (Strings* p = &(this.strs)) { // fill 0
                    for (int i = 0; i < 128; i++) {
                        p->str[i] = 0;
                    }
               }

               int cnt=0;
               for(int k=0; k<value.Length ; k++) {
                   string s=value[k];
                   fixed (Strings* p = &(this.strs)) {
                       int len=0;
                       try {
                           len=s.Length;
                       } catch {};
                       for (int i = 0; i < len && cnt < Config.Strings_size; i++) {
                            p->str[cnt++] = Convert.ToByte(s[i]);
                        }
                       if (cnt >= Config.Strings_size) break;
                       p->str[cnt++]=0; // close string by 0
                   }
               }
           }
       }


        // очистка памяти до заводского состояния АТмеги
        public void clear() {
            fixed (EEPROM* p = &this) {
                for (int bp = 0; bp < Config.EEPROM_SIZE; bp++)
                    p->_data[bp] = 0xff;
            };
            // заполнять
            //   pan.fw_version = conf.eeprom.FW_version ;
            //   pan.cs_version = conf.eeprom.CS_version;

        }

    } //struct eeprom


    internal class Config {

        public const int EEPROM_SIZE = 1024; // ATmega328

        public const int OSD_CALL_SIGN_TOTAL = 8; // длина позывного
        public const int OSD_SENSOR_FORMAT_TOTAL = 15; // длина форматной строки, 4+4+16 = 24 байта на сенсор

        const int Settings_offset = OSD.Settings_offset; // 512 - половина
        const int OffsetBITpanel = OSD.OffsetBITpanel;
        public const int Settings_size = 256; // EEPROM_SIZE - Settings_offset; //512; //sizeof(Settings) + 4 - остаток        
        public const int Strings_size = 256;

        internal EEPROM eeprom;

        private OSD osd;// ссылка на родителя для удобия доступа

        // методы
        public Config(OSD aosd) {
            osd = aosd;
            eeprom = new EEPROM();
            eeprom.clear();
        }

        internal bool readEEPROM(int length) {
            bool fail = false;
            ArduinoSTK sp = osd.OpenArduino();
            byte[] data;

            if (sp != null && sp.connectAP()) {
                try {
                    for (int i = 0; i < 5; i++) { //try to download two times if it fail
                        data = sp.download(EEPROM_SIZE);
                        if (sp.down_flag) {
                            eeprom.data = data;
                            break;
                        } else {
                            if (sp.keepalive())
                                Console.WriteLine("keepalive successful (iter " + i + ")");
                            else
                                Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                    }
                } catch (Exception ex) {
                    if (ex != null) {
                        MessageBox.Show(ex.Message);
                        fail = true;
                    }
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
                fail = true;
            }

            try {
                sp.Close();
            } catch{};

            return fail;
        }

        public int writeEEPROM(int start, int length) {
            ArduinoSTK sp = osd.OpenArduino();
            int err = 0;

            if (sp != null && sp.connectAP()) {
                try {
                    bool spupload_flag = false;

                    for (int i = 0; i < 10; i++) { //try to upload two times if it fail
                        spupload_flag = sp.upload(eeprom.data, (short)start, (short)length, (short)start);
                        if (!spupload_flag) {
                            if (sp.keepalive())
                                Console.WriteLine("keepalive successful (iter " + i + ")");
                            else
                                Console.WriteLine("keepalive fail (iter " + i + ")");
                        } else
                            break;

                        if (!spupload_flag)
                            err = 1;
                    }
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                    err = -1;
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
                err = -1;
            }

            sp.Close();

            return err; 
        }

        public void setEepromXY(Panel pan, bool enabled) {
            int flag =  pan.Altf == 1 ? 0x40 : 0;
            int flag2 = pan.Alt2 == 1 ? 0x20 : 0;
            int flag3 = pan.Alt3 == 1 ? 0x10 : 0;
            int flag4 = pan.Alt4 == 1 ? 0x40 : 0;

            int fSign = pan.sign == 0 ? 0x80 : 0; // inverted

            int y=pan.y & 0x0f;
            int x=pan.x & 0x3f;

            eeprom[osd.panel_number * OSD.OffsetBITpanel + pan.pos] = (byte)(x | fSign | flag4); // x
            eeprom[osd.panel_number * OSD.OffsetBITpanel + pan.pos + 1] = (byte)((enabled ? y : y | 0x80) | flag | flag2 | flag3); // y
        }

        public Pos getEepromXY(Panel pan) {
            return new Pos(eeprom[osd.panel_number * OSD.OffsetBITpanel + pan.pos],
                            eeprom[osd.panel_number * OSD.OffsetBITpanel + pan.pos + 1]);
        }

        public string ReadCharsetVersion() {
            EEPROM tempEeprom = new EEPROM();


            bool fail = false;
            ArduinoSTK sp = osd.OpenArduino();


            if (sp != null && sp.connectAP()) {
                try {
                    for (int i = 0; i < 5; i++) { //try to download two times if it fail
                        byte[] data = sp.download(EEPROM_SIZE);
                        if (!sp.down_flag) {
                            if (sp.keepalive())
                                Console.WriteLine("keepalive successful (iter " + i + ")");
                            else
                                Console.WriteLine("keepalive fail (iter " + i + ")");
                        } else {
                            eeprom.data = data;
                            break;
                        }
                    }
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
                fail = true;
            }

            sp.Close();

            if (!fail) {
                //lblLatestCharsetUploaded.Text = "Last charset uploaded to OSD: " + tempEeprom[CS_VERSION1_ADDR].ToString() + "." + tempEeprom[CS_VERSION1_ADDR + 1].ToString() + "." + tempEeprom[CS_VERSION1_ADDR + 2].ToString(); 
                return tempEeprom.CS_version;
            }
            return "";
        }

        public bool WriteCharsetVersion(string version, bool showMsg = true) {
            //			byte[] tempEeprom = new byte[3];
            //			tempEeprom[0] = (byte)version[0];
            //			tempEeprom[1] = (byte)version[1];
            //			tempEeprom[2] = (byte)version[2];

            EEPROM tempEeprom = new EEPROM();

            ArduinoSTK sp = osd.OpenArduino();

            if (sp != null && sp.connectAP()) {
                // Сначала считать
                try {
                    for (int i = 0; i < 5; i++) { //try to download two times if it fail
                        byte[] data = sp.download(EEPROM_SIZE);
                        if (sp.down_flag) {
                            tempEeprom.data = data;
                            break;
                        } else {
                            if (sp.keepalive())
                                Console.WriteLine("keepalive successful (iter " + i + ")");
                            else
                                Console.WriteLine("keepalive fail (iter " + i + ")");
                        }
                    }
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                    return false;
                }

                tempEeprom.CS_version = version;

                try {
                    bool spupload_flag = false;
                    for (int i = 0; i < 10; i++) { //try to upload two times if it fail
                        //						spupload_flag = sp.upload(tempEeprom, (short)0, (short)tempEeprom.Length, (short)CS_VERSION1_ADDR);
                        spupload_flag = sp.upload(tempEeprom.data, (short)Settings_offset, (short)Settings_size, (short)Settings_offset);
                        if (!spupload_flag) {
                            if (sp.keepalive())
                                Console.WriteLine("keepalive successful (iter " + i + ")");
                            else
                                Console.WriteLine("keepalive fail (iter " + i + ")");
                        } else
                            break;
                    }
                    if (spupload_flag) {
                        if (showMsg)
                            MessageBox.Show("Done writing configuration data!");

                    } else
                        MessageBox.Show("Failed to upload new configuration data");
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();
            return true;
        }

        public OSD.ModelType GetModelType() {
            OSD.ModelType modelType = OSD.ModelType.Unknown;
            EEPROM tempEeprom = new EEPROM();

            ArduinoSTK sp = osd.OpenArduino();

            if (sp.connectAP()) {
                try {
                    for (int i = 0; i < 5; i++) { //try to download two times if it fail
                        byte[] data = sp.download(EEPROM_SIZE);
                        if (!sp.down_flag) {
                            if (sp.keepalive()) Console.WriteLine("keepalive successful (iter " + i + ")");
                            else Console.WriteLine("keepalive fail (iter " + i + ")");
                        } else {
                            tempEeprom.data = data;
                            break;
                        }
                    }
                    modelType = (OSD.ModelType)tempEeprom.sets.model_type;
                } catch (Exception ex) {
                    MessageBox.Show(ex.Message);
                }
            } else {
                MessageBox.Show("Failed to talk to bootloader");
            }

            sp.Close();

            //Setup configuration panel
            return modelType;
        }


    } // class
} // namespace

