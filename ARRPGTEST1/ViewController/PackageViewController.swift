//
//  PackageViewController.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/3/26.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PackageViewController: UICollectionViewController {
    
    var collection = [CollectionViewCell]()
    var packageData = [PackageData]() //測試用
    var missionData : MissionData? //  如果加入（）則是創建空的missionData
    
    var photo : [UIImage] = [
        UIImage(named: "Unknow_Item")!,
        UIImage(named: "Unknow_Item")!,
        UIImage(named: "Unknow_Item")!,
        UIImage(named: "Unknow_Item")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:    UIImage(named : "TitlePageBackground")!)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        /*
        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "itemCell"/*reuseIdentifier*/)
 */
       print("背包中的missionData ： \(missionData?.missionIntegrate[1])")
        /*
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "TitlePageBackground")
        bgImage.contentMode = .scaleToFill
        self.collectionView!.backgroundView = bgImage
        */ //背景更換無效
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell"/*reuseIdentifier*/, for: indexPath)
        
        if let customizedCell = cell as? CollectionViewCell {
            
                customizedCell.imageView.contentMode = .scaleAspectFit //限制圖片縮放
            customizedCell.imageView.frame.size = cell.frame.size
            
                SetImageAlpha()
                customizedCell.imageView.image = photo[indexPath.row]
                //customizedCell.backgroundColor = UIColor(patternImage: UIImage(named: "Unknow_Item")!)
                // Configure the cell
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    private func SetImageAlpha(){

            if(missionData!.missionIntegrate[1].isComplete == true){
                //photo[0] = UIImage(named: "image (1)")!
                photo[3] = UIImage(named: "image (4)")!
                
                //photo[1] = UIImage(named: "image (2)")!
                //photo[2] = UIImage(named: "image (3)")!
            }
        
            if (missionData!.missionIntegrate[2].isComplete == true){
                photo[2] = UIImage(named: "image (3)")!
            }
            if (missionData!.missionIntegrate[3].isComplete == true){
            photo[0] = UIImage(named: "image (1)")!
            }
        
        if (missionData!.missionIntegrate[4].isComplete == true){
            photo[1] = UIImage(named: "image (2)")!
        }
        
        
    }
    
}//end of PackageViewController

extension UICollectionViewFlowLayout {
    /// 修正collection布局有缝隙
    func fixSlit(rect: inout CGRect, colCount: CGFloat, space: CGFloat = 0) -> CGFloat {
        let totalSpace = (colCount - 1) * space
        let itemWidth = (rect.width - totalSpace) / colCount
        let fixValue = 1 / UIScreen.main.scale
        var realItemWidth = floor(itemWidth) + fixValue
        if realItemWidth < itemWidth {
            realItemWidth += fixValue
        }
        let realWidth = colCount * realItemWidth + totalSpace
        let pointX = (realWidth - rect.width) / 2
        rect.origin.x = -pointX
        rect.size.width = realWidth
        return (rect.width - totalSpace) / colCount
    }
    
}
extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
