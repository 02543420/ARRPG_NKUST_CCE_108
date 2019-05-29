//
//  ScriptView.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/3/2.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit

class ScriptView: UIView {
    var nameLabel : UILabel!
    var label : UILabel!
    var index = 0 //文字顯示順序
    
    private var Radius: CGFloat {  //半徑,他也影響線條縮放
        return min(bounds.size.width, bounds.size.height) / 8
    }
    
    public func FirstTextLoad(name: [String],textname : [String]) {
        //self.backgroundColor = UIColor(patternImage: (UIImage(named: "對話框")!))
        self.layer.contents = UIImage(named: "對話框")?.cgImage
        nameLabel = UILabel(frame: CGRect(x: Radius, y: 0, width: self.frame.size.width * 0.8, height: self.frame.size.height * 0.4))
        nameLabel.numberOfLines = 0
        
        label = UILabel(frame: CGRect(x: Radius, y: Radius, width: self.frame.size.width * 0.8, height: self.frame.size.height * 0.5))
        label.numberOfLines = 0
        //label.textColor = UIColor.white
        label.isHidden = false  //不讓文字一開始就直接出現
        
        //TextName(name: name)
        TextContain(playerName:  name, scriptName: textname)//需要給予字串陣列,讓文字循序輸出
        
        
        // Do any additional setup after loading the view.
    }

    
    func TextContain(playerName: [String] , scriptName : [String]) { //從字串陣列空間區分還有多少空間,同時輸出名字
        for i in 0...(scriptName.count - 1 ) {
            for j in 0...(playerName.count - 1){
                if index == i{
                    if(playerName == ["???"]){
                        nameLabel.text = playerName[j]
                    }else if (playerName[j] == "\(PlayerData.init().GetName())" ){//寫法待修正
                        nameLabel.text = playerName[j]
                    }else if (index >= 4){
                        nameLabel.text = playerName[j]
                    }else { //其餘的控制
                        nameLabel.text = playerName[j]
                    }
                    label.text = scriptName[index]
            }
            
                
                
               // label.text = scriptName[index]
            }//end of if
        }//end of i_loop
        self.addSubview(nameLabel)
        self.addSubview(label)
    }//end of TextContain
    
    
    let animation = FFStringAppear1by1Animation()
    func Animations() {
        
        animation.appearDuration = 0.01
        label.ff_startAnimation(animation)
        
    }
    
    func stopAnimation(){
        //super.layer.removeAllAnimations()
        //animation.stopAnimation()
        //animation.targetView?.isHidden = false
        label.text = "......"
        
        //    label.ff_startAnimation(animation)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
