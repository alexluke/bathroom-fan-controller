
#include <avr/power.h>
#include <TinyWireM.h>
#include <TinyLiquidCrystal.h>
#include <TinyDHT.h>

#define BUTTON_PIN 4
#define HUM_HIGH 60
#define HUM_LOW 55
#define OVERRIDE_TIME 300000

TinyLiquidCrystal lcd(0);
DHT dht(1, DHT11);
boolean fanOn = false;
boolean buttonPressed = false;
unsigned long overrideTime;

void setup() {
  if (F_CPU == 16000000)
    clock_prescale_set(clock_div_1);

  pinMode(BUTTON_PIN, INPUT);

  lcd.begin(20, 4);
  lcd.setBacklight(HIGH);
  
  dht.begin();
}

void loop() {
  
  if (digitalRead(BUTTON_PIN) == HIGH && !buttonPressed) {
    fanOn = !fanOn;
    overrideTime = millis();
  }
  buttonPressed = digitalRead(BUTTON_PIN) == HIGH;
  
  int8_t h = dht.readHumidity();
  int16_t t = dht.readTemperature(true);
  
  lcd.setCursor(0, 0);
  if (t == BAD_TEMP || h == BAD_HUM) {
    lcd.print("Unable to read");
  } else {
    lcd.print("Temperature:");
    lcd.setCursor(13, 0);
    lcd.print(t);
    lcd.print(" F");
    
    lcd.setCursor(0, 1);
    lcd.print("Humidity:");
    lcd.setCursor(13, 1);
    lcd.print(h);
    lcd.print(" %");
  }
  
  lcd.setCursor(0, 2);
  lcd.print("Button:        ");
  if (buttonPressed) {
    lcd.setCursor(8, 2);
    lcd.print("PRESSED");
  }
  
  lcd.setCursor(0, 3);
  lcd.print("Fan is: ");
  lcd.print(fanOn ? " ON" : "OFF");
}
