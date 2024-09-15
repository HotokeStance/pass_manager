# pass_manager

パスワード等を管理できるアプリです<br />
データの引き継ぎはQRコードを読み込むことで簡単に引き継ぎできます！

# 開発環境

Flutter ver3.19.5<br />
Dart ver3.3.3

# 起動方法

fvm flutter run -d {デバイスID}

# 利用方法

## データの追加

<img width=120 src="readme/add_data.jpg" />

プラスのアイコンから、データの追加画面に遷移できます。

<img width=120 src="readme/add_data_screen.jpg" />

データを入力したら「保存」を押してください。

## パスワードのコピー

データの一覧画面から、任意のデータをタップすることでパスワードのコピーが行えます。

<img width=120 src="readme/copy_data.jpg" />

長押しで削除できます

<img width=120 src="readme/delete_data.jpg" />

## データの引き継ぎ方法

<img width=120 src="readme/display_qr.jpg" />

データを登録している端末でQRを表示します。

<img width=120 src="readme/display_qr_dis.jpg" />

このようにQRが表示されます。

### QRを読み込む

<img width=120 src="readme/read_qr_icon.jpg" />

一番右のアイコンを押すと、カメラが起動します。

<img width=120 src="readme/read_qr_camera.jpg" />

QRが読み込まれると「保存」ボタンが表示されます。<br />
保存を押すと上書きするかどうか確認画面が表示されます。


<img width=120 src="readme/confirm_force_write.jpg" />


上書きした場合はQRを読み込んだ側の端末データは全て削除されます。
