#include <gSoftSerial.h>
gSoftSerial ss(8, 7);

void setup() {
  Serial.begin(115200);
  ss.begin(9600);
}

void loop() {
  while (ss.available())
    Serial.write(ss.read());
}
