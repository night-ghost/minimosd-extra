# minimosd-extra

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
* plane flight modes fixed

v823
* добавлен флаг "Альтернативный режим" ко всем панелям
* Панели WindSpeed, Airspeed и Groundspeed в Альтернативном режиме отображают скорость в м/с вместо км/ч
* новый чарсет для отображения m/s


v824
* новая схема расчета высоты


Внимание! Эта версия несовместима с утилитами из оригинальной MinimOSD!

Если вам понравился проект и вы хотите поддержать его дальнейшее развитие - вы можете это сделать [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=F5UY65DJHF3TQ)

