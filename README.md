# minimosd-extra (russian wil be in tail of this file)

Quickstart Guide (c) Johnex
----------------------
1. Download the latest MinimOSD-Extra build here: https://github.com/night-ghost/minimosd-extra/blob/master/osd_latest.zip
2. Run the OSD_Config.exe
3. Connect your MinimOSD to your pc making sure you are using an FTDI that has 5V and not 3.3V.
4. After the usb driver is installed, select your COM port in OSD_Config.
5. Click Options -> Update Firmware. Select the latest MinimOsd_Extra_Uni.8XXDV-release.hex file from the "FW_+_Char" folder.
6. This firmware has a built in character set uploader, so just click Options -> Update CharSet. Select the latest character set MinimOSD_2.4.1.X.mcm from the "FW_+_Char" folder. Notice that this MimimOSD-Extra has a custom character set and must be updated if coming from another fork or the original, and some newer versions might require a new version, always check the "FW_+_Char" folder.
7. Set your video mode to Auto if you have different cam types, or select NTSC or PAL if you have just 1 cam and you know it's type or had issues with Auto.
8. Connect your OSD directly to a monitor or to a video transmitter so you can see the OSD output, making sure you don't forget to connect the antenna to the video transmitter before powering it on if you are using that. Click Options -> Load TLog. Select 2015-09-06 18-40-55.tlog from the "FW_+_Char" folder.
9. Set up the screens as you want. Click "Save Tab to OSD" and then click "Start" to run a simulation so you can see how everything looks without having to set up a copter. If something is not right, click "Stop", do the changes, save the config again and click "Start" again to see the new changes.
10. If you encounter that your screen is not centered, change the "Offsets", Left and Top from the config page. You can also move panels away from the edge if your screen gets cropped.



Description


* refactored a bit - now uses much less memory and can use less EEPROM

* also MAX7456 renew doing in VSYNC to get rid of "snow" on screen - like 
in http://forum.rcdesign.ru/f90/thread132831-195.html#post5602416 but on interrupt instead of polling via SPI.

* Also PSTR to all strings

* NEW FEATURES:

* 4 screens instead of 2

* individual control of sign icon of each panel per screen

* voltage, current & RSSI can be used from external pins

* TLOG player in configurator - now settings can be checked without working plane/copter!

* RADAR (like in MiniNAZAosd) and ILS in Horizon, can be enabled individually

* horizon angles can be adjusted, indepentently in PAL and NTSC

* PAL/NTSC detected dynamically - now can use different cameras!

* screen offsets via configurator

* can use additional pins (that can be found on some boards) for measuring 2nd battery current and voltage

* new GPS coords - in one line

* fixed a lot of old bugs of CT

* Any RC channel can be translated to output pin (eg. for cameras switch)

* Setup screen! Some parameters can be adjusted without computer - by RC 

* Panel in CT can be dragged over any point, not only for the upper left corner

If you like this project and want to support further development - you can do it! [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SLUC8B3U7E7PS)


v813:

* HUD borders can be turned off
* RADAR point can show track (3 points) - requires charset 2.4.1.2
* RSSI values now is 2 bytes and has no 255 limit

v816:

* Walkera telemetry output (for DEVO RX705/RX707 receivers) now working!
* Support of CleanFlight/MWII protocol (untested)
* Support of AutoQuad's MAVlink dialect (untested)
* support for new APM_Plane modes for quad-plane
* new parameters in Setup screen
* much more space optimizations

v817:

* Filtered out GCS messages translated by Plane 3.4+ and Copter 3.3+
* Auto Baud Rate!

v818

* fixed bug with battery
* fixed bug with time scale
* fixed bug with font uploading (auto-baud makes it broken)

* Character_Updater subproject now shares common codebase and can be used, also it can show current font
* SPI speed is lowered to prevent glitches in charset

v820

* bugfixes
* Charecter Updater HEX


v821
* fixed NTSC in CT
* better UAVtalk & mwii syncronization
* PWM_IN interrupt enabled only if used


v822 
* plane flight modes fixed

v823
* add new flag to all panels that turns on "alternate" mode for some panels
* WindSpeed, Airspeed and Groundspeed in Alternate mode shows speed on m/s instead of km/h
* new charset to show m/s

v824
* new altitude calculation scheme

ATTENTION! this version is NOT compatible with original MinimOSD tools!

v825
* MAVlink messages on your screen!

v826

* MAVlink message scrolled if length more than screen width

v827

* new tLog parser which knows .tlog format and not allows to lose sync
* thread-safe status in CT
* optimized looptime
* optimized memory usage
* no more "show battery percentage" checkbox and flag - this can be configured per-screen via "alternate" mode
* sensors to output arbitrary readings
* new GeoFence warnings

v828

* sensor has "pulse mode" checkbox
* some optimizations

v829

* Altitude panel can be reset to 0 on arming
* new logic of flight results show

v830

* fixed bug with HUD frame
* fixed bootloader dependency of SingleSerial

v831
* screen switch in rotation mode can be done only once

v832

* fixed bug with vertical speed in m/s

v833

* fixed bug with negative vertical speed

v834

* fixed bug with flight results
* fixed heading panel placement
* heading panel now can have icon 
* mavlink message scrolling can be turned off
* fixed placement of time panel
* time's semicolon is blinked

v835
* blinking of time can be turned off
* really fixed placement of time panel

v836
* support for LTM telemetry protocol (untested)


v837

* some code cleanup, recompiled with another GCC keys set
* fixed bug with Message panel

v838

* filtered out MAVlink messages from gimbal
* CT now can connect OSD' port to any another COM port (Options - Connect to COM port)
* fixed strange bug with errorneos cursor movements on Setup screen

v839
* fixed Vertical Speed panel broken in v838


v840
* fixed "No data" compiler's bug
* corrected panTune view
* some "eye candy" in panEff
* fixed panSetup bug an all
* natural time scale in TLOG player
* fixed CT bug with saving alternate function flag

v841
* "No GPS fix!" warning shown only when GPS is present

v842
* one good man from GCC team told me two "secret" (not mentioned in GCC --help) optimization flags so we now has ~1Kbyte of free space!
* thanks above - added 2nd, 3rd and 4th alternate checkboxes to each panel
* thanks above - all Horizon settings moved to Horison panel flags so it now can be setted per screen.
* modified FlightResults logics for plane
* all distances can be more than 99km
* gps coords can display only fractional part of coords
* fixed the screen sticking on a large data stream
* removed panGPS2, added flag to panGPS "Display in row" instead

v843
* 3DR modem RSSI can be used as RSSI source
* additional fields in flight results - current, vertical speed up & down
* support for GPS-less setup: Alt and Groundspeed works without GPS
* flight data shown on "no input data" screen - for setup on ground station


v844
* new panel for HDOP
* new panel for channel status - 5 steps


v845
* fixed bug in ChannelStatus panel
* CT clears message after 10s

v846

* panRose's scale ("icon") can be placed below
* panRose can be even size to be centered with HUD - reqires font 2.4.1.4. sacrificed characters @, ~, `

v847
* fixed NTSC inconsistency with the CT
* removed % from panRSSI in CT
* added ability to exclude MAVlink from build
* all telemetry protocol's files moved to 'protocols' folder
* fixed panel size for all distances
* fixed GPS icon for RTK modules

v848
* fixed bug with BatteryPercent in percent mode

v849
* new panel "channel scale" - graphical version of ChannelStatus

v850
* new palel "Channel value" that only shows raw value for selected channel

v851
* panel "Channel scale" now has an ability to use extended PWM range (thanks to Tonyyng)

v582
* panel "Channel status" got extended PWM range too
* screen update moved to ISR so OSD now is completely snow-free
* first try to support EEPROM streengs
* first try to make config via MAVlink
* 852a - fixed bug with flickering panels
* 852b - fixed framerate bug
* 852c - again fixed framerate bug

v853
* strings now are working! And Channel State panel uses first 5 of them

v854
* an attempt to recover a hung MAX7456

v855
* write configuration via MAVlink is now working! But only on recent verions of ArduPilot which translates GCS messages to output

v856
*fixed bug with panel's properties visibility
* 856a - fixed bug with incorrect restoring panel's flags

v857
* fixed bug with panel selection in CT
* complementary filter of panEff changed from 1/10 to 1/100
* a try to change Horizon behavior for large banks (>70grad)
* minor fixes

Attention! This version is incompatible with the tools from the ArduCam and original MinimOSD-extra!

Discussion forum - http://www.rcgroups.com/forums/showthread.php?t=2591835


/* RUSSIAN */

БЫстрый старт


1. Загрузите последнюю версию MinimOSD-Extra отсюда: https://github.com/night-ghost/minimosd-extra/blob/master/osd_latest.zip
2. Запустите OSD_Config.exe
3. Подключите MinimOSD на ваш компьютер, убедившись, что вы используете FTDI с напряжением 5V, а не 3.3V.
4. После установки драйвера USB, выберите COM-порт в OSD_Config.
5. Нажмите кнопку Options -> Update Firmware. Выберите последнюю версию файла MinimOsd_Extra_Uni.8XXDV-release.hex из папки "FW_+_Char".
6. Эта прошивка имеет встроенный загрузчик знакогенератора, так что просто нажмите кнопку Options -> Renew CharSet. Выберите последний набор символов MinimOSD_2.4.1.X.mcm из папки "FW_+_Char". Обратите внимание на то, что этот MimimOSD-Extra имеет свой набор символов, и не будет работать с символами из других версий. Поэтому знакогенератор модуля должен быть обновлен, так что всегда проверяйте папку "FW_+_Char".
7. Установите режим видео на Auto, если у вас одновременно различные типы камер, или выбрать NTSC или PAL, если у вас есть только один камера, и вы знаете ее тип.
8. Подключите OSD непосредственно к монитору или видео передатчик, так чтобы увидеть вывод OSD, убедившись, что вы не забыли подключить антенну к видеопередатчику перед включением его. Нажмите кнопку Options -> Load TLOG. Выберите 2015-09-06 18-40-55.tlog из папки "FW_+_Char".
9. Настройте экраны, как вы хотите. Нажмите кнопку "Save Tab to OSD", а затем нажмите кнопку "Start", чтобы запустить моделирование. Теперь вы сможете увидеть как все выглядит на самом деле без необходимости подключать коптер/самолет. Если что-то не так, нажмите кнопку "Stop", сделайте изменения, сохраните конфигурацию и нажмите кнопку "Пуск" снова, чтобы увидеть новые изменения.
10. Если вы обнаружите, что ваш экран не по центру, то можете изменить "Offsets", слева и сверху, на вкладке конфигурации. Можно также перемещать панели подальше от края, если ваш экран обрезан.





Описание отличий

* Отрефакторил, убрав чудовищный расход памяти на хранение всех настроек всех возможных экранов сразу, также 
убрал "регистры" флагов (и все с ними связанное) в пользу хранения вместе с координатами. Ну и по 
мелочи - PSTR, PROGMEM и отказ от ненужных статических массивов. 

* В результате имеем свободных 721 байт вместо 160 в оригинале. 

* Также сделано обновление памяти MAX7456 во время VSYNC дабы избавиться от "снега" на экране из-за помех, по мотивам
http://forum.rcdesign.ru/f90/thread132831-195.html#post5602416 но через прерывание вместо странного поллинга 
через SPI.

* Также сделана регулировка отступов от края экрана через конфигуратор

** НОВЫЕ ВОЗМОЖНОСТИ!

* Объединены самолет и коптер, выбор производится по значению из EEPROM и может МЕНЯТЬСЯ НА ЛЕТУ!

* Уменьшен расход EEPROM в три раза (!). В результате можно задать 4 экрана вместо 2-х и при этом куча свободного места под новые параметры.

* Чтение-запись EEPROM в цикле а не индивидуальными байтами - нет больше длинных "портянок"

* Видимость иконок - обозначений каждой "панели" задается индивидуально, независимо по экранам

* Напряжения, токи и RSSI могут читаться с дополнительных выводов (со сглаживанием по 8 отсчетам),
источник и поправочные коэффициенты задаются в конфигураторе независимо

* Переключение экранов может производиться по внешнему PWM для использования с номерами каналов выше 8

* В авиагоризонте сделаны поправочные коэффициенты (независимые для PAL и NTSC), и добавлен "Радар" (по мотивам МиниНазаОСД). 

* Видимость Радара и ILS задается индивидуально.

* Изменена логика формирования "панелей", так что теперь мелкие панели могут использовать незадействованные области крупных панелей. 
Это позволило отрисовывать радар, ILS и центральный маркер в пределах авиагоризонта

* Переключение PAL/NTSC может производиться "на лету", без перезагрузки - позволяя использовать две камеры разных форматов

* в коде сделан отладочный HEX-дамп прямо на экран

* В конфигураторе сделан плеер TLOG - теперь можно проверить работу OSD без самолета/коптера.

* Смещение экрана относительно синхроимпульсов задается через конфигуратор

* Изменен шрифт для отображения всех новых вкусностей

* Сделан вариант отображения координат GPS в одну строку

* Добавлена возможность вывода любого канала наружу в PWM 

* После всего этого остается свободно 325 байт памяти и 2+к флеша.

* Экран настройки! До арма можно менять некоторые параметры без компьютера - просто с пульта

* Исправлено множество старых багов конфигуратора

* панель в конфигураторе можно таскать за любую точку а не только за левый верхний угол


Если вам понравился проект и вы хотите поддержать его дальнейшее развитие - вы можете это сделать [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=F5UY65DJHF3TQ)


v813:
* Рамка HUD может выключаться
* РАДАР обзавелся "следом" в 3 точки, требует свежего шрифта
* значения RSSI 2 байта - убрано ограничение в 255

v816:

* Трансляция MAVlink в телеметрию Walkera на выход (для DEVO RX705/RX707 receivers) работает!
* поддержка CleanFlight/MWII протокола (не тестировано)
* поддержка диалекта MAVlink от AutoQuad   (не тестировано)
* поддержка новых режимов APM_Plane (quad-plane)
* новые параметры на экране Настройки (Setup)
* дальнейшая оптимизация места чтобы это все впихнуть :)

v817:

* отфильтрованы сообщения с наземной станции, транслируемые версиями Plane 3.4+ и Copter 3.3+
* автоматическое определение скорости последовательного порта!

v818

* исправлен баг с отображением батареи
* исправлен баг с масштабом времени
* восстановлена загрузка шрифтов (поломаная автоопределением скорости порта)

* подпроект Character_Updater теперь использует те же вспомогательные файлы и может использоваться,  также он отображает загруженный шрифт
* Скорость SPI уменьшена для предотвращения глюков при загрузке шрифтов

v820

* bugfixes
* Charecter Updater HEX

v821
* починено отображение режима NTSC в конфигураторе
* лучшая синхронизация протоколов UAVtalk & mwii - не проглатывается стартовый символ
* прерывание PWM_IN разрешено только если используется

v822 
* исправлено отображение самолетных режимов

v823
* добавлен флаг "Альтернативный режим" ко всем панелям
* Панели WindSpeed, Airspeed и Groundspeed в Альтернативном режиме отображают скорость в м/с вместо км/ч
* новый чарсет для отображения m/s


v824
* новая схема расчета высоты

v825

* Отображение сообщений MAVlink!

v826

* MAVlink message двигается на экране если не влезает целиком


v827

* новый парсер tLog, который знает его формат и не позволяет OSD терять синхронизацию
* thread-safe статус в конфигураторе
* оптимизировано время цикла
* оптимизирован расход памяти
* удалены "show battery percentage" галка и флаг - теперь этот режим задается независимо для каждого экрана в свойствах панели
* сенсоры для отображения произвольных значений в произвольном формате
* новые предупреждения о сработке GeoFence

v828

* сенсоры могут работать в режиме PWM
* некоторая оптимизация ресурсов

v829

* Высота может сбрасываться в 0 при арминге
* новая логика отображения панели результатов полета

v830

* исправлен баг с отображением рамки горизонта (HUD frame)
* исправлена зависимость от загрузчика библиотеки SingleSerial

v831

* переключение экранов в режиме "по кругу" может делаться только один раз

v832

* исправлен баг с вертикальной скоростью в m/s

v834

* исправлен баг с результатами полета
* исправлено расположение панели heading
* панель heading может иметь иконку
* скролл сообщения mavlink может быть отключен
* исправлено расположение панели time
* двоеточие времени сделано мигающим

v835
* мигание двоеточия времени может быть отключено
* действительно исправлено расположение панели time

v836
* поддержка протокола телеметрии LTM (untested)

v837
* чистка кода, пересборка с другими ключами компиляции
* исправлен баг с панелью Message


v838

* отфильтровываются сообщения MAVlink от подвеса
* Конфигуратор может подать поток телеметрии на OSD с любого COM-порта
* исправлен странный баг с самопроизвольным движением  курсора на экране настройки


v839
* исправлена вертикальная скорость, сломаная в v838

v840
* Обойден баг компилятора, приводивший к "No data"
* исправлен вид panTune 
* некоторые красивости в panEff
* полностью исправлен баг panSetup
* естественный ход времени в плеере TLOG
* исправлен баг конфигуратора с несохранением флага альтернативной функции


v841
* Предупреждение "No GPS fix!" отображается только при наличии GPS


v842
* один хороший человек из команды GCC подсказал два "секретных" (не упомянутых в GCC --help) флага оптимизации, что освободило  ~1Kbyte памяти!
* благодаря этому добавлены 2-й, 3-й и 4-й флаги для каждой панели
* благодаря этому все настройки авиагоризонта перемещены в флаги панели Horizon, и могут быть настроены поэкранно
* изменена логика показа результатов полета для самолета
* все расстояния могут быть больше чем 99км
* Панель gps координат может отображать только дробную часть координат
* исправлено залипание экрана на больших скоростях данных
* Удалена панель GPS2, вместо нее у панели GPS сделан флаг "Показывать в строке" ("Display in row")


v843
* RSSI от 3DR модема может использоваться как источинк RSSI
* дополнительные значения в результатах полета - ток и скорости подъема/снижения
* поддержка аппаратов без GPS: панели высоты и скорости работают и без GPS
* Результаты полета отображаются на экране "no input data" - например для использования OSD на наземной станции


v844
* новая панель  HDOP
* новая панель "channel status" - 5 позиций


v845
* исправлен баг в панели ChannelStatus
* CT очищает сообщение через 10 секунд

v846

* Шкала ("иконка") панели компаса (panRose) может располагаться снизу
* Сама панель panRose может быть четного размера дабы центрироваться относительно авиагоризонта. Требует загрузки шрифта 2.4.1.4. 
 Пожертвованы символы @, ~, `

v847
* исправлено несоответствие с конфигуратором в режиме NTSC
* удален знак % из panRSSI в конфигураторе
* добавлена возможность исключить MAVlink при сборке
* все файлы телеметрийных протоколов перемещены в папку 'protocols'
* исправлен размер панели для всех расстояний
* исправлена иконка GPS для модулей с поддержкой RTK


v848
* исправлен баг с отсутствием галки у панели BatteryPercent

v849
* новая панель Шкала "channel scale" - графическое представление панели Статус Канала

v850
* новая панель "Channel value" которая отображает значение для выбранного канала

v851
* панель "Channel scale" обзавелась возможностью работать в расширенном диапазоне PWM (thanks to Tonyyng)


v582
* панель "Channel status" тоже может работать с расширенным диапазоном PWM
* обновление экрана перенесено в процедуру обработки прерывания и теперь полностью избавлено от "снега"
* первая попытка поддержки строк в EEPROM
* первая попытка поддержки конфигурации через MAVlink
* 852a - fixed bug with flickering panels

v853
* Строки работают! И панель Channel State использует первые 5 из них

v854
* попытка восстановления зависшей MAX7456

v855
* запись конфигурации через MAVlink теперь работает! Но только на старших версиях ArduPilot которые транслируют команды с наземной станции на выход

v856
* исправлен баг с видимостью свойств панели

v857
* исправлен баг с выбором панели в конфигураторе
* комплиментарный фильтр панели panEff изменен с 1/10 на 1/100
* попытка изменить поведение горизонта для больших кренов (>70grad)
* мелкие изменения

Внимание! Эта версия несовместима с утилитами из оригинальной MinimOSD!


Обсуждение - http://www.ykoctpa.ru/groups/eye-in-a-sky/forum/topic/minimosd-novaya-proshivka/
