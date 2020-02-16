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

① Arduino IDEをPCにインストールします。

-|インストー方法は下記事で詳しく紹介しています。
--|--
1|<a href="https://algorithm.joho.info/arduino/ide-install-download/">【Arduino】IDEのインストール＆ダウンロード</a>

② デバイスドライバを公式ページ(<a href="https://m5stack.com/pages/download">https://m5stack.com/pages/download</a>)からダウンロードし、インストールします。
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

<h2>【動作確認】サンプルスケッチ実行</h2>
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
