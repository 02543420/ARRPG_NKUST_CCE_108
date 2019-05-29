//
//  DetailViewController.swift
//  ARRPGTEST1
//
//  Created by student.cce on 2019/4/2.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
var name : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLabel.numberOfLines = 0
        nameLabel.text = name
        // Do any additional setup after loading the view.

        
    }
    @IBOutlet weak var nameLabel: UILabel!
    

}
