//
//  TitlePageViewController.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/2/11.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit
import AVFoundation

class TitlePageViewController: UIViewController {
    let playdata = PlayerData.init()
    let missiondata = MissionData()
    var audioPlayer: AVAudioPlayer! //音樂播放
    var soundEffect : AVAudioPlayer! //音效播放
    
    
    
    @IBOutlet weak var label: UIView!
    @IBOutlet weak var ImageAnimated: UIView!

    
    @IBAction func ClearButton(_ sender: UIButton) {
        playdata.DeleteName()
        //playdata.DeleteTimer()  //暫時不再用到
        playdata.DeletePoint()
        missiondata.DeleteMissionData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Music()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "TitlePageBackground")!)
        
        UIView.animate(withDuration: 1.8,
                       animations: {self.ImageAnimated.alpha = 1}
        )//圖片顯示動畫
        
        // Do any additional setup after loading the view.
    }
    
    func Music() {
        let url = Bundle.main.url(forResource: "02 FINAL FANTASY XIII ～誓い～", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()//此方法可以預載至緩衝區,並獲得播放音源所需的硬體功能，進而大幅大減少使用play()方法與聲音播出的延遲
        } catch {
            print("Error:", error.localizedDescription)
        }
        
        let done = Bundle.main.url(forResource: "crrect_answer2", withExtension: "mp3")
        do {
             soundEffect = try AVAudioPlayer(contentsOf: done!)
             soundEffect.prepareToPlay()//此方法可以預載至緩衝區,並獲得播放音源所需的硬體功能，進而大幅大減少使用play()方法與聲音播出的延遲
        } catch {
            print("Error:", error.localizedDescription)
        }
        //audioPlayer.enableRate = true //允許系統調整播放速率
        //audioPlayer.rate = 1.5
        audioPlayer.play()
        audioPlayer.numberOfLoops = -1 //重複播放,若為負數則無窮次播放
        
        soundEffect.enableRate = true //允許系統調整播放速率
        soundEffect.rate = 0.75
    }
    
    @IBAction func tapTouch(_ sender: UITapGestureRecognizer) {
        audioPlayer.stop() //一點擊將音樂停止,否則離開此頁面音樂依然持續播放
        soundEffect.play() //音效播放
        if( playdata.GetName() == ""){
            if let controller = storyboard?.instantiateViewController(withIdentifier: "NewPlayerPage"){
                present(controller, animated: true, completion: nil)
            }
        }else{
            if let controller = storyboard?.instantiateViewController(withIdentifier: "DefaultPage"){
                present(controller, animated: true, completion: nil)
            }
        }
    }//不使用segue切換頁面
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let opts : UIView.AnimationOptions = [ .autoreverse , .repeat] //前面為動畫倒帶,後面不斷重複
        UIView.animate(
            withDuration : 1.0,
            delay : 1.8 ,
            options : opts ,
            animations : { self.label.alpha = 1 }
        )
        
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
