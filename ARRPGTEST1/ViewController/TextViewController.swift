//
//  TextViewController.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/1/29.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit
import ZCAnimatedLabel

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Dash()
        
        
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var labelText: UILabel!
    
    func Dash(){
        ZCDashLabel.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        
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
