#include <WiFi.h>
#include <M5Stack.h>
#include "DHT12.h"
#include <Wire.h> //The DHT12 uses I2C comunication.
#include "Adafruit_Sensor.h"
#include <Adafruit_BMP280.h>

const char* ssid = "panzer4"; // SSID
const char* password = "atmega64a"; // PASSWORD
DHT12 dht12; //Preset scale CELSIUS and ID 0x5c.
Adafruit_BMP280 bme;
float tmp = 0;
float hum = 0;
float pressure = 0;
String html = "";

WiFiServer server(80);

// Wifiに接続
void setup()
{
    M5.begin();
    Wire.begin();

    while (!bme.begin(0x76)){  
      Serial.println("Could not find a valid BMP280 sensor, check wiring!");
      M5.Lcd.println("Could not find a valid BMP280 sensor, check wiring!");
    }
    delay(100);
    M5.Lcd.setTextSize(3);  // 文字サイズ
    M5.Lcd.println("Connecting");

    // wifi接続開始
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        M5.Lcd.print(".");
    }

    // 接続完了したらIP表示
    M5.Lcd.println("Successed");
    M5.Lcd.println("IP: ");
    M5.Lcd.println(WiFi.localIP());
  
    server.begin();

}

void getData(){
    // 温度の取得
    tmp = dht12.readTemperature();

    // 湿度の取得
    hum = dht12.readHumidity();

    // 気圧の取得[hPa = Pa * 0.01]
    pressure = bme.readPressure() * 0.01;
    html = "<p>Temperature:" + String(tmp);
}

void loop(){
    //M5.Lcd.println(". ");
    WiFiClient client = server.available();             // listen for incoming clients
        if (client) {                        // if you get a client,
        M5.Lcd.println("New Client.");            // print a message out the serial port
        String currentLine = "";            // make a String to hold incoming data from the client
        while (client.connected()) {            // loop while the client's connected
            if (client.available()) {             // if there's bytes to read from the client,
                char c = client.read();             // read a byte, then
                M5.Lcd.write(c);            // print it out the serial monitor
                if (c == '\n') {            // if the byte is a newline character
                    // if the current line is blank, you got two newline characters in a row.
                    // that's the end of the client HTTP request, so send a response:
                    if (currentLine.length() == 0) {
                        // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
                        // and a content-type so the client knows what's coming, then a blank line:
                        client.println("HTTP/1.1 200 OK");
                        client.println("Content-type:text/html");
                        client.println();

                        // the content of the HTTP response follows the header:
                        client.print("Click <a href=\"/H\">here</a> to turn the LCD GREEN.<br>");
                        client.print("Click <a href=\"/L\">here</a> to turn the LCD RED.<br>");
                        client.print(html);
                        
                        // The HTTP response ends with another blank line:
                        client.println();
                        // break out of the while loop:
                        break;
                    } else {            // if you got a newline, then clear currentLine:
                        currentLine = "";
                    }
                } else if (c != '\r') {  // if you got anything else but a carriage return character,
                    currentLine += c;            // add it to the end of the currentLine
                }

                // Check to see if the client request was "GET /H" or "GET /L":
                if (currentLine.endsWith("GET /H")) {
                    getData();
                }
                if (currentLine.endsWith("GET /L")) {
                    M5.Lcd.fillScreen(RED);            // GET /L turns the LCD RED
                }
            }
        }
        // close the connection:
        client.stop();
        M5.Lcd.println("Client Disconnected.");
    }
    M5.update();
}
