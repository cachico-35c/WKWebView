# SwiftでWKWebViewを使ってJSから連携する
WKWebViewとJavaScriptの連携をいつも？？？となるのでWKWebViewのセッティングと合わせてメモしておきます。
*サンプルコードをお手元に展開しておくとスムーズです。

## frameworkの読み込みを忘れずに。
地味によく忘れるので。。。
<img width="605" alt="スクリーンショット 2020-06-02 11 37 17" src="https://user-images.githubusercontent.com/62793390/83537376-70a30800-a52f-11ea-89c5-aa87a6c87f26.png">

## WKWebviewの初期設定。
AutoLayoutに対応させるのになぜかStoryboadでは失敗したのでコードで生成します。
その上での説明になります。
<img width="599" alt="スクリーンショット 2020-06-02 11 42 55" src="https://user-images.githubusercontent.com/62793390/83537466-89132280-a52f-11ea-87d9-f96a0882c832.png">

①WKWebViewConfiguration
WKWebViewConfigurationとはWebページがレンダリングされるまでの時間、メディア再生の処理方法、ユーザーが選択できるアイテムの細分性、およびその他の多くのオプションを決定できるそうです。
そのオプションとして「WKUserContentController」を使いJavaScriptからのメッセージを受け取ることができるようです。

②以降はDelegateの設定等々です。
なおAutoLayout対応のフルスクリーンメソッドは[こちら](https://qiita.com/haru15komekome/items/894ddaa33e1d7aabfe26)を参考にさせてもらってます。

## WKScriptMessageHandler(JavaScriptの受取指定)
こちらのメソッドでJSからのHandlerを受け取ります。
WKWebViewConfigurationで設定したnameを指定してください。
<img width="672" alt="スクリーンショット 2020-06-02 11 42 10" src="https://user-images.githubusercontent.com/62793390/83537419-7dbff700-a52f-11ea-8ca2-b2941b525991.png">
あとは煮るなる焼くなりです。

## Web側の設定（サーバ側のHTML）
<img width="611" alt="スクリーンショット 2020-06-02 11 43 42" src="https://user-images.githubusercontent.com/62793390/83537498-93cdb780-a52f-11ea-84bd-36691569c94e.png">
このように何かのトリガーでWebView側へ連携してください。
この書き方だとWeb側で設定したメッセージをWKWebViewを経由してネイティブでアラート表示させてます。
*コメント部分は処理がエラーだった場合など。

# Usage
サンプルの.swiftはXcodeでプロジェクトに組み込んでください。
*URLの設定はご自身のサーバを指定ください。（ローカルは想定していません）
index.phpはサーバへあげて確認してください。


何かしらの時短にでもなれば！

