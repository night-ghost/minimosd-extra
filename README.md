# minimosd-extra (russian is at the tail of this file)

Quickstart Guide (c) Johnex
----------------------
1. Download the latest MinimOSD-Extra build here: https://github.com/night-ghost/minimosd-extra/blob/master/osd_latest.zip?raw=true
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

* and much more! See [CHANGELOG.md](https://github.com/night-ghost/minimosd-extra/blob/master/CHANGELOG.md)

If you like this project and want to support further development - you can do it! [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SLUC8B3U7E7PS)USD
  [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HXRA6EXZJ489C) EUR


changelog in [CHANGELOG.md](https://github.com/night-ghost/minimosd-extra/blob/master/CHANGELOG.md)
some descriptions are in [wiki](https://github.com/night-ghost/minimosd-extra/tree/master/wiki)

fonts:

MinimOSD_2.4.1.x.mcm         - base font
MinimOSD_2.4.1.x-digital.mcm - styled for 7-segment and dotted horizon



Attention! This version is incompatible with the tools from the ArduCam and original MinimOSD-extra!

Discussion forum - http://www.rcgroups.com/forums/showthread.php?t=2591835 (abandoned) http://www.ykoctpa.ru/groups/eye-in-a-sky/forum/topic/minimosd-english-support-thread/#post-9147


/* RUSSIAN */

Быстрый старт


1. Загрузите последнюю версию MinimOSD-Extra отсюда: https://github.com/night-ghost/minimosd-extra/blob/master/osd_latest.zip?raw=true
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

* и многое другое - смотрите [историю версий](https://github.com/night-ghost/minimosd-extra/blob/master/CHANGELOG_RU.md)

Если вам понравился проект и вы хотите поддержать его дальнейшее развитие - вы можете это сделать 
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=F5UY65DJHF3TQ) USD  
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=M4ZSKGXMWVGXU) RUB


история версий в файле [CHANGELOG_RU.md](https://github.com/night-ghost/minimosd-extra/blob/master/CHANGELOG_RU.md)


Шрифты:

MinimOSD_2.4.1.x.mcm         - основной фонт
MinimOSD_2.4.1.x-digital.mcm - стилизация под 7-сегментный индикатор и точечный горизонт


Внимание! Эта версия несовместима с утилитами из оригинальной MinimOSD!


Обсуждение - http://www.ykoctpa.ru/groups/eye-in-a-sky/forum/topic/minimosd-novaya-proshivka/


ЛИЦЕНЗИОННОЕ СОГЛАШЕНИЕ (честно потыренное у Ubilling)


Данный программный продукт (далее ПП) распространяется под лицензией GNU GPL v.2 с полностью открытым кодом и полностью бесплатно.
Так было всегда, так и останется. Без компромиссов. THIS IS SPARTA OPENSOURCE!!!
Обрекший себя на использование данного продукта принимает тот факт, что ему никто и ничего не должен.
Вообще никаких гарантий - ни явных ни подразумеваемых. Все работает так как работает.
Перед использованием ПП верующим рекомендуется поставить свечку в храме, атеистам - геморроидальную.
Мы не несем никакой ответственности за хаос, панику, разрушения и апокалипсис, возникшие в процессе эксплуатации. 
Если у вас возникли вопросы - потрудитесь почитать документацию. Если документация не дала ответов о смысле жизни - попробуйте спросить на форуме.
По умолчанию все баги являются фичами, если вы считаете что нашли багу - попробуйте ее использовать в повседневной жизни ну или расскажите нам.
Если у вас есть какая-то хотелка нужная строго вам - вы можете реализовать ее либо самостоятельно и сделать PR на гитхабе, 
либо заказать, либо продолжать хотеть. 
Это намек на то, что бесплатно работать фуллтайм на вас никто не вписывался.

