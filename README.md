# minimosd-extra (russian wil be in tail of this file)

Quickstart Guide (c) Johnex
----------------------
1. Download the latest MinimOSD-Extra build here: https://github.com/night-ghost/minimosd-extra/osd_latest.zip
2. Run the OSD_Config.exe
3. Connect your MinimOSD to your pc making sure you are using an FTDI that has 5V and not 3.3V.
4. After the usb driver is installed, select your COM port in OSD_Config.
5. Click Options -> Update Firmware. Select the latest MinimOsd_Extra_Uni.8XXDV-release.hex file from the "FW & Char" folder.
6. This firmware has a built in character set uploader, so just click Options -> Update CharSet. Select the latest character set MinimOSD_2.4.1.X.mcm from the "FW & Char" folder. Notice that this MimimOSD-Extra has a custom character set and must be updated if coming from another fork or the original, and some newer versions might require a new version, always check the "FW & Char" folder.
7. Set your video mode to Auto if you have different cam types, or select NTSC or PAL if you have just 1 cam and you know it's type or had issues with Auto.
8. Connect your OSD directly to a monitor or to a video transmitter so you can see the OSD output, making sure you don't forget to connect the antenna to the video transmitter before powering it on if you are using that. Click Options -> Load TLog. Select 2015-09-06 18-40-55.tlog from the "FW & Char" folder.
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


If you like this project and want to support further development - you can do it! [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=F5UY65DJHF3TQ)


/* RUSSIAN */

БЫстрый старт


1. Загрузите последнюю версию MinimOSD-Extra отсюда: https://github.com/night-ghost/minimosd-extra/osd_latest.zip
2. Запустите OSD_Config.exe
3. Подключите MinimOSD на ваш компьютер, убедившись, что вы используете FTDI с напряжением 5V, а не 3.3V.
4. После установки драйвера USB, выберите COM-порт в OSD_Config.
5. Нажмите кнопку Options -> Update Firmware. Выберите последнюю версию файла MinimOsd_Extra_Uni.8XXDV-release.hex из папки "FW & Char".
6. Эта прошивка имеет встроенный загрузчик знакогенератора, так что просто нажмите кнопку Options -> Renew CharSet. Выберите последний набор символов MinimOSD_2.4.1.X.mcm из папки "FW & Char". Обратите внимание на то, что этот MimimOSD-Extra имеет свой набор символов, и не будет работать с символами из других версий. Поэтому знакогенератор модуля должен быть обновлен, так что всегда проверяйте папку "FW & Char".
7. Установите режим видео на Auto, если у вас одновременно различные типы камер, или выбрать NTSC или PAL, если у вас есть только один камера, и вы знаете ее тип.
8. Подключите OSD непосредственно к монитору или видео передатчик, так чтобы увидеть вывод OSD, убедившись, что вы не забыли подключить антенну к видеопередатчику перед включением его. Нажмите кнопку Options -> Load TLOG. Выберите 2015-09-06 18-40-55.tlog из папки "FW & Char".
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


Внимание! Эта версия несовместима с утилитами из оригинальной MinimOSD!

Если вам понравился проект и вы хотите поддержать его дальнейшее развитие - вы можете это сделать [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=F5UY65DJHF3TQ)

