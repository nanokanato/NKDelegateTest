NKDelegateTest
=============
http://nanoka.wpcloud.net  

テスト内容
-----
SwiftのprotocolでDelegateを宣言して起動時処理後に通知するテスト

・AppDelegateにてdelegateを設定したNKBootControllerを表示
・NKBootControllerにて起動時のアニメーション後delegateに自身とBool型を投げる
・AppDelegateでNKBootControllerとBool型を受け取りNKViewController(ホーム画面)を表示