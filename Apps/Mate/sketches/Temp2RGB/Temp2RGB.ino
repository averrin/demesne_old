int redPin = 9;
int greenPin = 10;
int bluePin = 11;

int red;
int green;

void setup()
{
    pinMode(redPin, OUTPUT);
    pinMode(greenPin, OUTPUT);
    pinMode(bluePin, OUTPUT);
}

void loop()
{
    int val;
    int dat;
    val=analogRead(0);
    red = map(val,0, 1024, 0, 255);
    green = map(val, 0, 1024, 255, 0);
    analogWrite(redPin, red);
    analogWrite(greenPin, green);
}