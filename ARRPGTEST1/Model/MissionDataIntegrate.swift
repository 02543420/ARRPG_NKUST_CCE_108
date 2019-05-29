//
//  MissionDataIntegrate.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/4/24.
//  Copyright © 2019 student.cce. All rights reserved.
//

import UIKit
import CoreData

struct MissionDataIntegrate {
    var identifier = 0
    var isAcception = false
    var isComplete = false
    var taskName : String?
    var taskContent : String?
    var image : UIImage?
    private static var identifierFactory = -5
    
    private static func UpUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = MissionDataIntegrate.UpUniqueIdentifier()
    }
    
}
