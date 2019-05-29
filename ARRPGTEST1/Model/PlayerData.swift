//
//  PlayerData.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/3/3.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import Foundation

class PlayerData {
    public var PlayerName = ""
    private let userDefaults = UserDefaults.standard
    //var firstgame = true
    
    var playerSchedule = 0 //任務紀錄點...或是對話進度點..?（SavePoint)
    
    
    func GetName() -> String{
        return userDefaults.value(forKey: "playerName") as? String ?? PlayerName
    }
    /*
    func GetFirstGameTimer()->Bool{
        return userDefaults.value(forKey: "gameTimer")! as? Bool ?? firstgame
    }*/
    
    func SaveName(){
        userDefaults.set("\(PlayerName)", forKey: "playerName")
    }
    
    func DeleteName(){
        userDefaults.removeObject(forKey: "playerName")
        
    }
    
    func DeleteTimer(){
        userDefaults.removeObject(forKey: "gameTimer")
    }
    /*
    func isFirstgamer(){
        userDefaults.set(firstgame, forKey: "gameTimer")
    }
    
    func NotFirstGamer(){
        firstgame = false
        userDefaults.set(firstgame, forKey: "gameTimer")
    }
    */
    func SavePoint(){
        playerSchedule += 1
        userDefaults.set(playerSchedule, forKey: "savePoint")
    }
    
    func DeletePoint() {
        userDefaults.removeObject(forKey: "savePoint")
    }
    
    func GetSchedulePoint() -> Int {//將進度回傳至ViewController,方便對話框的文字顯示判定
        return userDefaults.value(forKey: "savePoint") as? Int ?? playerSchedule
    }
    
    
    init(name : String) {
        self.PlayerName = name
        print("\(PlayerName)")
        self.SaveName()
    }
    init(){
        if(self.PlayerName == ""){
        PlayerName = ""
        }
        /*
       if(firstgame == true){
           // firstgame = true
            isFirstgamer()
       }else{
            NotFirstGamer()
        }
         */
    }
}

