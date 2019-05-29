//
//  NewplayerViewController.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/3/1.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit

class NewplayerViewController: UIViewController {
    
    lazy var name = PlayerData(name: self.playerName)
    
    var playerName : String!
    var label : UILabel!
    var index = 0 //文字顯示順序
    var script = ["...",
                  "......",
                  "...似乎有人叫我，我是...誰呢？",
                  "...",
                  "算了...不管我是誰，我得先知道這裡是哪裡才行"]
    
    
    @IBOutlet weak var textView: ScriptView!
    
    
    //@IBOutlet weak var textView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        /*
         label = UILabel(frame: CGRect(x: 30, y: 0, width: self.textView.frame.size.width * 0.8, height: self.textView.frame.size.height * 0.7))
         label.numberOfLines = 0
         label.isHidden = true  //不讓文字一開始就直接出現
         TextContain()
         */
        textView.FirstTextLoad(name: ["???"], textname: script)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Animations()
        textView.Animations()
    }
    
    private func NameAlert() {
        let alert = UIAlertController(
            title: "請輸入你的名字",
            message: "",
            preferredStyle: .alert
        )
        
        alert.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "你的名字"
            textField.allowsEditingTextAttributes = true
        }
        
        let okAction = UIAlertAction(
            title: "ok",
            style: .default,
            handler: {
                (action :UIAlertAction!)->Void in print("確認名字")
                let text = (alert.textFields?.first)! as UITextField
                if (text.text == ""){
                    self.NameAlert() //玩家沒輸入名字便要求再次輸入
                }else{
                    self.playerName = text.text
                    self.name.PlayerName = self.playerName //給資料庫玩家名字的資訊
                    self.script[3] += "\(self.name.PlayerName)嗎 "
                    self.textView.TextContain(playerName: [self.playerName], scriptName: self.script)
                    self.textView.Animations()
                }//end of if_else
        }//end of handler
        )//end of UIAlertAction
        
        alert.addAction(okAction)
        
        //顯示alert
        self.present(alert,animated: true,completion: nil)
    }//end of NameAlert
    
    @IBAction func TAP(_ sender: UITapGestureRecognizer) {
        textView.index += 1
        index += 1
        if( index == 3 ){
            NameAlert()
        }else{
            if(  playerName != nil ){
                textView.TextContain(playerName: [playerName], scriptName: script)
            }else{
                textView.TextContain(playerName: ["???"], scriptName: script)
            }
            //textView.TextContain(scriptName: script , playerName: ["???"])
            textView.Animations()
        }
        if( index == script.count ){
            //textView.label.isHidden = true
            textView.index = 0
            if let controller = storyboard?.instantiateViewController(withIdentifier: "DefaultPage"){
                present(controller, animated: true, completion: nil)
            }
        }//更換頁面 segue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
