# 環境建置

請先依照flutter官網，下載Android Studio並建置環境。
官網連結：https://flutter.dev/docs/get-started/install

# 專案建置
用Android Studio開啟專案後，打開terminal，移動到專案目錄下，並輸入下方指令。

```
flutter pub get
flutter packages pub run build_runner build  --delete-conflicting-outputs
```

此時應該會看到專案中多產生出了兩個.g檔(store_1.g.dart, store_2.g.dart)，且所有紅線都消失，已可執行。

# 執行
在ios或Android模擬器上執行專案後。接著

點擊"Store 1" Button，應會看到console印出下列文字。

```
I/flutter (11044): Store1: plus1
I/flutter (11044): store1.value: 1 (數字大小會隨著store1.value改變而改變)
```

點擊"Store 2" Button，應會看到console印出下列文字，

```
I/flutter (11044): Store2: addItem(1)
I/flutter (11044): store2.list1.length: 1 (數字大小會隨著store2.list1.length改變而改變)
```

畫面上，在Button下方的第一則文字，會隨著store1.value的變動而變動，第二則則否。

若不是此結果請注意是否加了額外的程式碼而觸發side effect，或不小心按下Save後引發Hot Reload。

# 參考資料
請閱讀下方的參考資料後，嘗試回答問題。

1. [A tour of the Dart language](https://dart.dev/guides/language/language-tour)
    - 若您未曾碰過dart語言，此頁面可以讓你快速瀏覽過此語言的特性。
2. [mobx](https://pub.dev/packages/mobx)
    - 此為mobx的主要套件，有autorun和store的介紹
3. [mobx-flutter](https://pub.dev/packages/flutter_mobx)
    - 此為mobx的Observer widget套件，負責處理畫面上的更新。
    - 若有需要觀看Observer原始碼，可看[舊版本](https://github.com/mobxjs/mobx.dart/blob/flutter_mobx-0.3.3+3/flutter_mobx/lib/src/observer.dart)的實作，比較容易理解。


# 題目
在_MyHomePageState這個class中

1. 擊點Plus1, autorun1 會印出log，請解釋
	a. 此autorun是如何完成監聽?
	b. 此autorun是如何完成觸發?

2. 擊點Add item, autorun2會印出log，請解釋
	a. 此autorun是如何完成監聽?
	b. 此autorun是如何完成觸發?

3. 承上，擊點Add item，請解釋
	a. autorun3 為何沒被觸發？
	b. 要如何觸發？

4. 擊點Plus1, 螢幕上的value1 會不斷更新， 請解釋Observer1 是如何完成監聽與觸發更新UI

5. 呈上，請解釋Observer2 為何無法更新?
