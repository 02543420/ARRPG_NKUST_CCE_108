//
//  PackageData.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/5/9.
//  Copyright © 2019 student.cce. All rights reserved.
//

import Foundation
class PackageData{
    var isGetItem : Bool!
    var identifier = 0
    var cells = CollectionViewCell()
    private static var identifierFactory = 0
    private static func UpUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = PackageData.UpUniqueIdentifier()
    }
    
}
