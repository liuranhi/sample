## はじめに
M5Stackは、カラーディスプレイ、Wi-Fi、Bluetooth、microSDカードスロット、バッテリーなどを備えたコンパクトで便利なモジュールです。 
（Arduinoよりも最初から色々と搭載されていて、コンパクトな感じです）
ESP32を搭載しているため、Arduino環境での開発もできます。

-|M5Stackの特徴
--|--
①|ESP32（Wi-Fi、Bluetooth通信可能）、microSDカードスロット、ボタン、USB、Groveのコネクタ、カラーLCDディスプレイ、バッテリー電源が約5cm四方のケースに詰め込まれている。
②|Arduinoのシールドのように、センサー等の載った拡張基板をメインモジュール（CORE）に積み重ね可能。
③|Arduino IDE、ESP-IDF、MicroPythonなど開発環境がいくつかある。（おすすめはArduino IDE）
④|Arduinoと同様、温湿度などのセンサーによる測定やモーター制御などハードウェア制御が可能。

## 開発環境構築

特徴③にあるとおり、M5Stackは開発環境がいくつかあります。それぞれの環境構築方法については下記事でそれぞれ紹介しています。（<strong>ESP32初心者の方はArduino IDEがおすすめ</strong>）

#### Arduino IDEのインストール
① Arduino IDEをPCにインストールします。

以下のリンクからArduino公式サイトのダウンロードページを開きます。
<a href="http://arduino.cc/en/Main/Software">http://arduino.cc/en/Main/Software</a>

② [Windows app Requires Win8.1 or 10]をクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2017/01/arduino-install-1.png" width="450px" />

③ [JUST DOWNLOAD]をクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2017/01/arduino-install-2.png" width="450px" />

④ [入手]をクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2017/01/arduino-install-3.png" width="450px" />

⑤ [Microsoft Storeを開く]という確認ダイアログが表示されるのでクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2017/01/arduino-install-5.png" width="450px" />

⑥ Microsoft Storeアプリが開き、Arduino IDEのインストール画面が表示されるので[インストール]をクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2017/01/arduino-install-6.png" width="450px" />

#### M5stackのドライバ等をインストール
① デバイスドライバを公式ページ(<a href="https://m5stack.com/pages/download">https://m5stack.com/pages/download</a>)からダウンロードし、インストールします。
※お使いのPCの環境にあったものをクリックしてダウンロード
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-1.png" width="450px" />

③ダウンロードしたZIPファイルを解凍します。
Windowsの場合、中にあるインストーラのうち、お使いのWindowsのビット数に合わせて、ドライバをインストールします。

種別|操作
--|--
32ビット版Windows|「CP210xVCPInstaller_x86_vx.x.x.x.exe」をダブルクリックしてインストール
64ビット版Windows|「CP210xVCPInstaller_x64_vx.x.x.x.exe」をダブルクリックしてインストール

<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-2.png" width="450px" />

④ M5StackをPCにUSB接続します。次に、デバイスマネージャを開き、CP210x USB to UART Bridgeのポート番号を確認します。
（下画像の例ではCOM7）

<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-3.png" width="450px" />

⑤ Arduino IDEを起動します。
つぎに、メニューから[ファイル] -> [環境設定]と選択します。
 
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-4.png" width="450px" />

⑥ 追加のボードマネージャーに、「https://dl.espressif.com/dl/package_esp32_index.json」を設定します。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-5.png" width="450px" />

⑦ メニューから[ツール] -> [ボード:～] -> [ボードマネージャ...]を選択します。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-6.png" width="450px" />

⑧ ダイアログで「ESP32」と検索し、[Install]をクリックします。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-7.png" width="450px" />

⑨ メニューから[スケッチ] -> [ライブラリのインクルード] -> [ライブラリの管理...]を選択します。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-8.png" width="450px" />

⑩ ダイアログで「M5Stack」と検索し、「M5Stack by M5Stack」をインストールします。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-9.png" width="450px" />
これで環境構築作業は完了です。

#### 解説動画
本節の内容はYoutubeでも解説しているので、よろしければそちらもご参考にしてください。
(https://www.youtube.com/watch?v=baYnmqDoIMM)[https://www.youtube.com/watch?v=baYnmqDoIMM]

## 【動作確認】サンプルスケッチ実行
M5Stackのサンプルプログラム（サンプルスケッチ）を実行し、動作確認をしてみます。 

① M5StackをPCにUSB接続します。次に、デバイスマネージャを開き、CP210x USB to UART Bridgeのポート番号を確認します。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-3.png" width="450px" />

② メニューから[ツール] -> [ボード：～] -> [M5Stack-Core-ESP32]を選択します。

<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-10.png" width="450px" />

③ メニューから[ツール] -> [シリアルポート]をクリックし、先程確認したCOMポートを選択します。（下画像はCOM7だった場合の例）

<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-11.png" width="450px" />

⑤ メニューから[ツール]をクリックし、以下のように設定されていることを確認します。

項目|設定
--|--
ボード|M5Stack-Core-ESP32
ボーレート（通信速度）|921600
COMポート|②で確認したCOMポート

<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-12.png" width="450px" />

⑥ [ファイル] -> [スケッチ例] -> [M5Stack] -> [Basics] -> [HelloWorld]を選択します。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-13.png" width="450px" />

⑦ [→]ボタンをクリックすると、コンパイルとM5Stackへの書き込みが始まるので終わるまで待ちます。
書き込みが終わると、M5StackのLCDに「Hello World!」と表示されます。
<img src="https://algorithm.joho.info/wp-content/uploads/2019/08/m5stack-arduino-14.jpg" width="450px" />


## BMP280 ENV ユニットで温度・湿度・気圧測定</h2>
BMP280 ENV Unit（amazonで1000円程度で入手可能）を使うことで簡単に温度・湿度・気圧を測定できます。

#### 前準備
① Arduino IDEのメニューから[ファイル] -> [設定] -> [追加のボードマネージャURL]に以下のURLを追加します。

```
https://adafruit.github.io/arduino-board-index/package_adafruit_index.json 
```

② メニューから[スケッチ] -> [ライブラリをインクルード] -> [ライブラリを管理]を選択します。

③ ダイアログで[Adafruit BMP280]と検索し、「Adafruit BMP280 Library」をインストールします。

これで事前準備は完了です。

#### サンプルコード
MP280 ENV UnitをM5StackのGroveコネクタに接続し、プロジェクト（https://github.com/nishizumi-lab/sample/tree/master/m5stack/bmp280/arduino/bmp280）をダウンロードしてArduino IDEで開いてコンパイルし、M5Stack書き込めば温度・湿度・気圧測定ができます。

（※↓後日、GIFかJPGに置き換えます）
<iframe width="400" height="265" src="https://www.youtube.com/embed/56TE5kLQk9E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


```arduino bmp.ino
#include &lt;M5Stack.h&gt;
#include &quot;DHT12.h&quot;
#include &lt;Wire.h&gt; //The DHT12 uses I2C comunication.
#include &quot;Adafruit_Sensor.h&quot;
#include &lt;Adafruit_BMP280.h&gt;

DHT12 dht12; //Preset scale CELSIUS and ID 0x5c.
Adafruit_BMP280 bme;

void setup() {
    M5.begin();
    Wire.begin();

    M5.Lcd.setBrightness(10);

    Serial.println(F(&quot;ENV Unit(DHT12 and BMP280) test...&quot;));

    while (!bme.begin(0x76)){  
      Serial.println(&quot;Could not find a valid BMP280 sensor, check wiring!&quot;);
      M5.Lcd.println(&quot;Could not find a valid BMP280 sensor, check wiring!&quot;);
    }
    // LCD初期化
    M5.Lcd.clear(BLACK);
    M5.Lcd.println(&quot;ENV Unit test...&quot;);
}

void loop() {
    // 温度の取得
    float tmp = dht12.readTemperature();

    // 湿度の取得
    float hum = dht12.readHumidity();

    // 気圧の取得[hPa = Pa * 0.01]
    float pressure = bme.readPressure() * 0.01;

    // 温度、湿度、気圧をシリアル通信で送信
    Serial.printf("Temperatura: %2.2f*C  Humedad: %0.2f%%  Pressure: %0.2fPa\r\n", tmp, hum, pressure);

    // LCDに温度、湿度、気圧を表示
    M5.Lcd.setCursor(0, 0); // カーソル
    M5.Lcd.setTextColor(WHITE, BLACK);  // 色
    M5.Lcd.setTextSize(4);  // 文字サイズ
    M5.Lcd.printf("Temp:%2.1f \nHumi:%2.0f%% \nPres:%2.0fhPa \n", tmp, hum, pressure);

    delay(100);
} ```

#### 解説動画
本節の内容はYoutubeでも解説しているので、よろしければそちらもご参考にしてください。
（YoutubeのURL：後日撮影します）

## 無線LANルーター（Wi-Fi）に接続
まず、指定した「SSID」「パスワード」のwifiに接続してみます。
以下のコードのSSIDとPASSWORDを接続する無線LANルーターのものに書き換え、M5Stackにプログラムを書き込みます。

```arduino
#include <WiFi.h>
#include <M5Stack.h>

const char* ssid = "SSID"; // SSID
const char* password = "PASSWORD"; // PASSWORD

WiFiServer server(80);

// Wifiに接続
void setup()
{
    M5.begin();
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


void loop(){

}
```

![実行結果](https://raw.githubusercontent.com/nishizumi-lab/sample/master/m5stack/wifi/wifi1/wifi1.jpg "実行結果")

M5stackのLCDにローカルIPアドレスが表示されたら接続成功です。
表示されているローカルIPアドレスは、M5Stackに割り当てられたローカルIPアドレスとなります。

## 簡易サーバーを構築し、温湿度大気圧を他の端末からモニタリング

準備中
