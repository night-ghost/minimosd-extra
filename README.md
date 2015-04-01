# minimosd-extra
Automatically exported from code.google.com/p/minimosd-extra

refactored a bit - now uses much less memory and can use less EEPROM

also MAX7456 renew doing in VSYNC to get rid of "snow" on screen - like 
in http://forum.rcdesign.ru/f90/thread132831-195.html#post5602416 but on interrupt instead of polling via SPI.

Also PSTR to all strings

/* RUSSIAN */

Отрефакторил, убрав чудовищный расход памяти на хранение всех настроек всех возможных экранов сразу, также 
убрал "регистры" флагов (и все с ними связанное) в пользу хранения вместе с координатами. Ну и по 
мелочи - PSTR, PROGMEM и отказ от ненужных статических массивов. 

В результате имеем свободных 721 байт вместо 160 в оригинале. После правки использования EEPROM планируется 
увеличить количество возможных экранов вдвое и вернуть закомментареные показометры и настройку

Также сделано обновление памяти MAX7456 во время VSYNC дабы избавиться от "снега" на экране из-за помех, по мотивам
http://forum.rcdesign.ru/f90/thread132831-195.html#post5602416 но через прерывание вместо странного поллинга 
через SPI.

Также сделана регулировка отступов от края экрана, пока через define но в планах также через конфигуратор

