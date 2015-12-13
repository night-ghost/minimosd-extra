struct ADCMeasure {
    byte pin;
    struct Measure *next;
    byte cnt;
    int buf[8];
    float value;
};

typedef struct ADCMeasure ADCmeasure;

