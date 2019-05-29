//
//  File.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/4/17.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit
import CoreData
class MissionData {//之後輸出請呼叫missionIntegrate，謝謝
    var missionIntegrate = [MissionDataIntegrate]()//任務陣列
    var missionID : Int = 0//任務編號
    //var missionID = MissionDataIntegrate().identifier
    let missionDefaults = UserDefaults.standard//儲存資料格式
    var playdata = PlayerData()

    //格式設定,對照任務ID完後再行任務內容判定
    var missions = [
        1 :"找尋Ｃ語言相關物件  由於村莊的系統程式與通訊設備出現\n問題，依據村莊商人可得知在恩凱優斯\n特城的電資研究學院，能夠找尋這些相關物品" ,
        2 :"放大器 與找尋Ｃ語言相關物件任務的地點相同\n，在恩凱優斯特城的電資學院可找尋相關物品",
        3 :"黑盒子 軍事科技研究所所需要研發黑科技的\n物件，可在技術中心的工程系院找尋相關物品",
        4 :"車鑰匙 遺失在電資系院某處的車用鑰匙\n，車型為豐田86",
    ]//請以空白鍵做任務名稱與內容區隔
    
    
    var photo : [UIImage] = [UIImage(named: "Unknow_Item")!,
        UIImage(named: "bookimage")!,
        UIImage(named: "OPAImage")!,
        UIImage(named: "blackboximage")!,
        UIImage(named: "carkeyimage")!]
    
    func SaveMissionCount(){
        missionDefaults.set(missionID, forKey: "ID")
        missionDefaults.synchronize()
        //missionDefaults.set(isAcception,forKey:"Accept")
    }//讓任務編號長度與是否有接任務的判定真正被儲存起來,而不因程式關閉而消失
    

    
    func GetMissionsCount()->Int{//取得目前接取任務
       return missionDefaults.integer(forKey: "ID")
    }
    
   /*
    func GetMissionComplete(ID : Int)-> Bool{
        missionIntegrate[ID].isComplete = true
        return missionIntegrate[ID].isComplete
    }
    */
    func DeleteMissionData(){
        missionDefaults.removeObject(forKey: "ID")
        //missionDefaults.removeObject(forKey: "Accept")
    }
    
    
    func MissionAccept(){//任務接受，id長度＋1
        missionID += 1
        SaveMissionCount()
        //missionIntegrate[GetMissionsCount()].isAcception = true
        //isAcception = true
        print("計數:\(GetMissionsCount())")
        SetMissionIntegrate()

     //   SaveMissionCount()
        
    }
  /*
    func GetMissionAccept()->Bool{
        return missionIntegrate[GetMissionsCount() ].isAcception
        //missionDefaults.bool(forKey: "Accept")
    }
    */
    func GetMissionName()-> String {//給missionIntegrate資料
            let temp = missions[GetMissionsCount()]!.components(separatedBy: " ")
            let name = temp[0]
        return name
    }
    
    
    func GetMissionContent()-> String {//給missionIntegrate資料
        let temp = GetMissionName().count
        for _ in 0...temp{
            missions[GetMissionsCount()]!.remove(at: missions[GetMissionsCount()]!.startIndex)
        }
        return missions[GetMissionsCount()]!
    }
    
    func GetMissionImage()->UIImage{
        return photo[GetMissionsCount()]
    }
    
    func SetMissionIntegrate(){
        missionIntegrate[GetMissionsCount()].taskName = GetMissionName()
        //print("名字呢？  \(GetMissionName())")
        print("我的名字是...\(missionIntegrate[GetMissionsCount()].taskName ?? "I haven't name Q^Q")")
        missionIntegrate[GetMissionsCount()].taskContent = GetMissionContent()
        print("我的內容是...\(missionIntegrate[GetMissionsCount()].taskContent ?? "Who cares(=T=)")")
        
        missionIntegrate[GetMissionsCount()].isAcception = true
            print("任務接受了嗎...\(missionIntegrate[GetMissionsCount()].isAcception)")
        
        missionIntegrate[GetMissionsCount()].image = GetMissionImage()
    }
    
    
    func ReportMission(name : String){
        for i in 1...GetMissionsCount(){
            //對比任務,若是完成了將從任務清單中將此任務標示為完成（各種方式表現）
            if(missionIntegrate[i].isAcception == true && name == missionIntegrate[i].taskName ){
                //missions.remove(at: missions.index(forKey: i)!)
                missionIntegrate[i].isComplete = true
                //missionIntegrate[i].taskName.append("Complete!")
                //missionID -= 1 //暫且保留
                //SaveMissionCount()
            }//end of if
            /*
            if (GetMissionsCount() == 0){//無任務狀態
                //isAcception = false
                SaveMissionCount()
            }//end of if
            */
        }//end of for-loop
    }//end of func

    init(){
        for _ in 0...missions.count{//開啟以後自動偵測需要有幾個任務的陣列空間
            let Mission = MissionDataIntegrate()
            missionIntegrate += [Mission]
            
        }
    }
 
    
}//end of MissionData

