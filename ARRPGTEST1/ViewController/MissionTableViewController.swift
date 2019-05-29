//
//  MissionTableViewController.swift
//  ARRPGTEST1
//
//  Created by damh on 2019/2/8.
//  Copyright © 2019年 student.cce. All rights reserved.
//

import UIKit

/*
private enum Ｍission: CaseIterable {
    case mission1,mission3
}

extension Ｍission{
        var missionLabel : String{
            switch self {
            case .mission1 : return "找尋Ｃ語言相關物件與放大器"
            case .mission3 : return ""
        }
    }
}
*/


class MissionTableViewController: UITableViewController  {
    var missionData : MissionData?
    var index = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: UIImage(named:"TitlePageBackground"))
        self.tableView.backgroundView?.alpha = 0.5
       // print("任務ＩＤ ：\(missionData?.GetMissionsCount())")
        print("have name?  \(missionData?.missionIntegrate[1].identifier)")
        //navigationItem.titleView = UIImageView(image: UIImage(named : "遊戲按鈕返回(觸發前)"))

        /*   let backImg = UIImage(named: "遊戲按鈕返回(觸發前)")
         navigationController?.navigationBar.backIndicatorImage = backImg
         navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg
         
         navigationItem.leftItemsSupplementBackButton = true
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
         */
        
        //透明化背景
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func missionCheck()->Bool{
        //index = count.identifier
        
        return index
    }
    
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
            //return 0
        
        return missionData?.GetMissionsCount() ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionCell", for: indexPath)
        
            cell.textLabel?.text = missionData?.missionIntegrate[indexPath.row + 1].taskName
        
        cell.imageView?.image = missionData?.missionIntegrate[indexPath.row + 1].image
        
        if(missionData?.missionIntegrate[indexPath.row + 1].isComplete == true){
            cell.textLabel?.textColor = UIColor.lightGray
            cell.isUserInteractionEnabled = false
        }//如果任務完成的話

            cell.textLabel?.textAlignment = NSTextAlignment.right
        
        // Configure the cell..
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "任務"
    }//section 顯示名稱
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    } //section 高度
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.orange
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        // header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .center
        
    }//調整section字體大小,顏色
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier{
            if identifier == "Show"{
                if let cell = sender as? UITableViewCell , let indexPath = tableView.indexPath(for: cell){
                    if let detailVC = segue.destination as? DetailViewController{
                print("identifier = \(missionData?.missionIntegrate[indexPath.row + 1].identifier ?? 0)")
                        detailVC.name = missionData?.missionIntegrate[indexPath.row + 1].taskContent
                        
                        /*
                        if (missionData.MissionName() == missionData.missions[1] ){
                            detailVC.name =  missionData.MissionContent(name: missionData.MissionName())
                            
                        }else if(missionData.MissionName() == missionData.missions[2] ){
                            detailVC.name = missionData.MissionContent(name: missionData.MissionName()) 
                        }
 */
                        
                    }
                    
                }
            }
            
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
}
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    




}
