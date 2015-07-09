//
//  NKBootController.swift
//  NKDelegateTest
//
//  Created by nanoka____ on 2015/07/09.
//  Copyright (c) 2015年 nanoka____. All rights reserved.
//

/*--------------------------------------------------------------------
; import : FrameworkやObjective-cを読み込む場合に使用
---------------------------------------------------------------------*/
import UIKit

/*--------------------------------------------------------------------
; protocol : Delegateの記述
---------------------------------------------------------------------*/
protocol NKBootControllerDelegate {
    //起動時処理終了後に呼び出されるメソッド
    func didEndBootController(bootController: NKBootController)
}

/*=====================================================================
; NKBootController
======================================================================*/
class NKBootController : UIViewController {
    
    //delegateを保持する変数
    var delegate: NKBootControllerDelegate!
    
    /*-----------------------------------------------------------------
    ; viewDidLoad : 初回Viewの読み込み時に呼び出される
    ;          in :
    ;         out :
    ------------------------------------------------------------------*/
    override func viewDidLoad() {
        //背景を白色にする
        self.view.backgroundColor = UIColor.blackColor()
        
        //白い円形のViewを画面中央に配置
        var circleView: UIView = UIView(frame: CGRectMake(0, 0, 0, 0))
        circleView.center = self.view.center
        circleView.backgroundColor = UIColor.whiteColor()
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        self.view.addSubview(circleView)
        
        //アニメーション
        UIView.animateWithDuration(0.3,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                //アニメーションの処理
                
                //circleViewを拡大
                circleView.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.height)
                circleView.center = self.view.center
                circleView.layer.cornerRadius = circleView.frame.size.width/2
            }, completion: { finished in
                //アニメーションの終了
                
                //起動時処理の終了を通知
                self.delegate.didEndBootController(self)
            }
        )
    }
}
