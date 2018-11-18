# it_calendar

2018&#x2F;11&#x2F;18 ハッカソン

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).


## GoogleMap
GoogleMapのAPIを環境変数で定義して利用している。

|変数|内容|
|:--|:--|
|MAP_SDK_API_KEY|Map SDK API Keyの値。AndroidとiOSの両方を有効にしておくこと|

android/apikey.properties にもAPIキーを記載している。  
android/apikey.propertiesを配置し、下記のようにapikeyに値を設定する。(値はダブルクォーテーションなどで囲わないこと)  
`apikey=xxxxxxxxxxx`