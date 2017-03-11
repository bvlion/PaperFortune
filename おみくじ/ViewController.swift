//
//  ViewController.swift
//  おみくじ
//
//  Created by 愛sMac on 2016/05/04.
//  Copyright © 2016年 愛sMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // メインイメージ
    @IBOutlet weak var mainImage: UIImageView!
    
    // 下部ボタン
    @IBOutlet var button: UIButton!
    
    // カウントダウンするラベル
    let countDownLabel = UILabel(frame:
        CGRectMake(ProjectUtil.screenWidth() / 2 - 250, ProjectUtil.screenHeight() / 2 - 250, 500, 500))
    
    // タイマー
    var timer : NSTimer!
    
    // カウントダウン中フラグ
    var isCheck = false
    
    // 結果画像配列
    let titles = ["1x.png", "2x.png", "3x.png", "4x.png", "5x.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カウントダウンラベルの初期化
        self.countDownLabel.text = countDownVal.description
        self.countDownLabel.textAlignment = NSTextAlignment.Center
        self.countDownLabel.font = UIFont.boldSystemFontOfSize(300)
    }
    
    // ボタン押下時挙動
    @IBAction func buttonClick(sender: UIButton) {
        // カウントダウンしてない
        if (!isCheck) {
            // 初期表示されているUIを隠す
            self.button.hidden = true
            self.mainImage.hidden = true
            // カウントダウンラベルの追加
            self.view.addSubview(self.countDownLabel)
            // タイマー起動
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update:", userInfo: nil, repeats: true)
            
            isCheck = true
            self.button.setTitle("メインに戻る", forState: UIControlState.Normal)
        } else {
            // 初期状態に戻す
            self.mainImage.image = UIImage(named: "main.png")
            self.button.setTitle("おみくじを引く", forState: UIControlState.Normal)
            isCheck = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // カウントダウン初期値
    var countDownVal = 3

    // タイマー更新メソッド
    func update(timer : NSTimer) {
        countDownVal -= 1
        // 0秒で終了
        if (countDownVal <= 0) {
            timer.invalidate()
            self.countDownLabel.removeFromSuperview()
            // ランダムに画像表示
            self.mainImage.image = UIImage(named: titles[(Int) (arc4random_uniform(5))])
            // UI再表示
            self.mainImage.hidden = false
            self.button.hidden = false
            countDownVal = 3
        }
        // テキスト更新
        self.countDownLabel.text = countDownVal.description
    }
}