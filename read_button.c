#define DELAY 50
#define SAMPLES 10
#define POSITIVE_READINGS 4

int digital_read(int port, int pin);
void delay(int ms);

int read_button(int port, int pin)
{
    int bit = digital_read(port, pin);
    if (!bit)
        return 0;
    int counter = 0;
    for (int i = 0; i < SAMPLES; i++)
    {
        delay(5);
        bit = digital_read(port, pin);
        if (!bit)
            counter = 0;
        else{
            counter++;
            if (counter >= POSITIVE_READINGS)
                return 1;
        }
    }
    return 0;
}