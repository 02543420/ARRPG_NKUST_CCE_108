//
//  ViewController.swift
//  ARRPGTEST1
//
//  Created by student.cce on 2018/11/13.
//  Copyright © 2018年 student.cce. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    //對話部分 空白字元前為名字,後方為台詞,請照此規則寫文本,謝謝
    var image = UIImage() //改變照片
    lazy var test = [
        "??? 你是",
        "??? 這個名字不是在神話中所撰註的名字嗎？",
        "??? 難不成你是勇者的轉世...?",
        "??? 咦？你問我是誰呀",
        "艾里西斯伊莉絲 我的名字是艾里西斯伊莉絲，是世界上最可愛的精靈呦",
        "艾里西斯伊莉絲 總之,看你一臉萌逼的樣子,就讓我來好好跟你說明吧",
        "艾里西斯伊莉絲 這個城鎮是恩凱優斯特城",
        "艾里西斯伊莉絲 這個地方有眾多技術學院以及科技大樓，技術學院主要是培育專業科技軍事人員，科技中心則是研究一些對於城鎮有利的相關科技資源！",
        "艾里西斯伊莉絲 尤其在技術學院中的電資系院在未來又有不同的專業選課領域，能夠讓學生在選課上更自由",
        "艾里西斯伊莉絲 將不再限制學生在畢業前須修畢該電資系院所規定的課程中所需要修完幾門課程的規定",
        "艾里西斯伊莉絲 對了，你既然來了就幫我一個忙吧！",
        "艾里西斯伊莉絲 在這個城鎮的技術學院技術工廠的系統程式以及通訊設備出現問題需要取得一些物品，並且恩凱優斯特城科技中心的軍事科技研究所也有委託任務",
        "艾里西斯伊莉絲 另外還有一位電資系院的教授委託的私人請求",
        "艾里西斯伊莉絲 他掉了汽車鑰匙車型是豐田86據說掉落地點是在電資學院的某個地方，找到後再歸還給他就可以了",
        "艾里西斯伊莉絲 所以綜合以上論述想請你去取得四項物品一個是Ｃ語言驅動程式第二個是放大器第三個是軍事科技研究所所想要取得的黑盒子第四個是汽車鑰匙，可以嗎？",
                     ]
    lazy var test1 = ["","艾里西斯伊莉絲 你已經取得第一個任務物品了喔！",
                      "艾里西斯伊莉絲 再多努力找找其他物品吧！",
    ]//故意空第一格陣列,避免重新呼叫對話框架
    lazy var test2 = ["","艾里西斯伊莉絲 妳已經取得第二個物品囉！",
                      "艾里西斯伊莉絲 加油加油～",]
    lazy var test3 = ["","艾里西斯伊莉絲 妳已經取得第三個物品囉！",
                      "艾里西斯伊莉絲 我心血來潮，順便講個笑話好了",
                      "艾里西斯伊莉絲 你知道什麼甜品最優秀嗎？",
                      "艾里西斯伊莉絲 答案是....巧克力，因為....",
                      "艾里西斯伊莉絲 巧克力棒啊！哈哈",
    ]
    lazy var test4 = ["","艾里西斯伊莉絲 終於收集到了最後一個物品了呢",
                      "艾里西斯伊莉絲 至於這個鑰匙的主人是誰完成任務就看看你的背包吧～",
    ]
    lazy var missiontest = ["","艾里西斯伊莉絲 謝啦！"]
    lazy var conversation00 = ["",
                               "艾里西斯伊莉絲 你願意幫忙嗎？",]
    
    lazy var conversation1 = ["",
    "艾里西斯伊莉絲 怎麼啦？ 難不成你忘記現在要做什麼了？",
    "艾里西斯伊莉絲 真是拿你沒辦法呢",
    "艾里西斯伊莉絲 你現在得去尋找四個物品",
    "艾里西斯伊莉絲 一個是Ｃ語言驅動程式，一個是放大器，一個是黑盒子，最後一個是車鑰匙",
    "艾里西斯伊莉絲 現在記住了嗎？不要再因為這種小事叫我出來囉！",
    "艾里西斯伊莉絲 要不然你就得一個人快．快．樂．樂．的．活．下．去．了，呵呵呵",
                              ]
    lazy var conversation2 = ["",
    "艾里西斯伊莉絲 還有什麼事嗎？",
    "艾里西斯伊莉絲 你想知道更多有關恩凱優斯特城的事？",
    "艾里西斯伊莉絲 恩凱優斯特城在去年與他國合併了",
    "艾里西斯伊莉絲 為什麼合併？",
    "艾里西斯伊莉絲 當然是為了增強國家的實力啊，與他國合併，得到的人才與經濟可是原比先前的多呢",
    "艾里西斯伊莉絲 至於其他的.......",
    "艾里西斯伊莉絲 我覺得呀，你別太依賴我的好",
    "艾里西斯伊莉絲 你也知道精靈是怎麼樣的種族對吧？",
    "艾里西斯伊莉絲 小心，我引導你到最後，帶領你到個不．毛．之．地喔",
    "艾里西斯伊莉絲 到時後悔可別賴我喔，呵．呵．呵"
                              ]
    
    var playdata = PlayerData.init()
    var gamerName : String!  //目前暫時沒用上，但先保留

    var index = 0 //對話判定用
    var touchTime = false //關閉對話框判定用
    var missionData = MissionData()
    var firstMissionisAcception = false
    var callFairyTime = false
    var fairyTalk = false //避免任務完成後進行額外對話未完就關閉對話框
    var conversation = 0 // 判定額外對話的內容,為0時則不進行任何額外對話
    var conversationCheck = false
    
    var package = PackageViewController()
    

    @IBOutlet weak var textView: ScriptView!
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var missionButton: UIButton!
    @IBOutlet weak var backpackButton: UIButton!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBAction func takePicture(_ sender: UIButton) {
        TrackingConfiguration()
    }
    
    @IBAction func callthefairy(_ sender: UIButton) {
        //強制讓對話內容重新讀取
        ResetModel()
        Model()
        fairyTalk = true
        if (callFairyTime == false){
            if(firstMissionisAcception == false){
                conversation = -1
                DiscoverScript()
                CoverButton()
            }else if(missionData.missionIntegrate[4].isComplete == true){
                conversation = 2 //呼叫conversation2
                DiscoverScript()
                CoverButton()
            }else{
                conversation = 1 //呼叫conversation1
                DiscoverScript()
                CoverButton()
            }
            
            
            callFairyTime = true
            
        }else if (callFairyTime == true){
            conversationCheck = true // 避免重複切割字串名稱
            
            if(firstMissionisAcception == false){
                conversation = -1
                DiscoverScript()
                CoverButton()
            }else if(missionData.missionIntegrate[4].isComplete == true){
                conversation = 2 //呼叫conversation2
                DiscoverScript()
                CoverButton()
            }
            else{
                conversation = 1
                DiscoverScript()
                CoverButton()
            }
            callFairyTime = false
            
            
        }
        //resetTrackingConfiguration()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Mission" {
                if let vc = segue.destination as? MissionTableViewController {
                    vc.missionData = missionData
                    print("prepareForSegue: \(missionData.missionIntegrate[1])")
                }
            } else if identifier == "Package" {
                if let vc = segue.destination as? PackageViewController{
                    vc.missionData = missionData
                    print("prepareForPackageSegue: \(missionData.missionIntegrate[1])")
                    
                }
            }else if identifier == "Map" {
                    if let vc = segue.destination as? MapViewController{
                        vc.missionData = missionData
                        print("prepareForMapSegue : \(missionData.missionIntegrate[1])")
                    }
                    
                }//end of else if
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定按鈕圖片縮放
        missionButton.imageView?.contentMode = .scaleAspectFit
        backpackButton.imageView?.contentMode = .scaleAspectFit
        pictureButton.imageView?.contentMode = .scaleAspectFit
        mapButton.imageView?.contentMode = .scaleAspectFit
        photoButton.imageView?.contentMode = .scaleAspectFit
        
        // Set the view's delegate
        sceneView.delegate = self

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
         // Create a new scene
 
        Model()
        //addTapGestureToSceneView()
        configureLighting()
        
        GetPlayerName()
        /*
        //給予最初預設值,避免玩家最初任務未接取便直接按任務鈕(會閃退)
        if(playdata.GetFirstGameTimer() == true){
            missionData.SaveMissionCount()
        }*/

        //隱藏NavigationBar
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.shadowImage = image
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
        TrackingConfiguration()
        setUpSceneView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    func Model() {
         guard let scene = SCNScene(named: "art.scnassets/Nueva Lilit.dae"),
               let node = scene.rootNode.childNode(withName: "IA_Mash", recursively: false)//給予節點
            else { return }
        // Set the scene to the view
        // scene.rootNode.position = SCNVector3(0,0,-100)//對根節點給予指定位置
        
        node.scale = SCNVector3(0.005,0.005,0.005)
        node.position = SCNVector3(0,-5,-6)
    sceneView.scene.rootNode.addChildNode(node)//將他加入根節點並成為其子點節
        
    }
    
    func CoverModel(){
         sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode() }
    }
    
    func ResetModel(){
        let config = ARWorldTrackingConfiguration()
        let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
        sceneView.session.run(config, options: options)
    }
    
    /*
    @objc func LoadModel(withGestureRecognizer recognizer: UIGestureRecognizer) {
        // Create a new scene
        
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        guard let hitTestResult = hitTestResults.first else { return }
        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        
        guard let shipScene = SCNScene(named: "art.scnassets/untitled2.dae"),
            let shipNode = shipScene.rootNode.childNode(withName: "IA_mesh", recursively: false)
            else { return }
        
        shipNode.scale = SCNVector3(0.05,0.05,0.05)
        shipNode.position = SCNVector3(x,y,z)
        sceneView.scene.rootNode.addChildNode(shipNode)
        
    }*/
    
    func setUpSceneView() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        
        sceneView.delegate = self
        //sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints] //顯示偵測點
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    /*
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.LoadModel(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }*/
    
    let fadeDuration: TimeInterval = 0.3
    let rotateDuration: TimeInterval = 3
    let waitDuration: TimeInterval = 0.5
    
    lazy var fadeAndSpinAction: SCNAction = {
        return .sequence([
            .fadeIn(duration: fadeDuration),
            .rotateBy(x: 0, y: 0, z: CGFloat.pi * 360 / 180, duration: rotateDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    
    lazy var fadeAction: SCNAction = {
        return .sequence([
            .fadeOpacity(by: 0.8, duration: fadeDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    
    var CarKeyNode: SCNNode = {
        guard let scene = SCNScene(named: "CarKey.dae"),
            let node = scene.rootNode.childNode(withName: "carkey", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.1
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = -.pi / 2
        return node
    }()
    
    var OPANode: SCNNode = {
        guard let scene = SCNScene(named: "OPA.dae"),
            let node = scene.rootNode.childNode(withName: "opa", recursively: false) else { return SCNNode() }
        let scaleFactor = 0.025
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x = -.pi / 2
        return node
    }()
    
    var bookNode: SCNNode = {
        guard let scene = SCNScene(named: "book.scn"),
            let node = scene.rootNode.childNode(withName: "book", recursively: false) else { return SCNNode() }
        let scaleFactor  = 0.1
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        return node
    }()
    
    var blackBoxNode: SCNNode = {
        guard let scene = SCNScene(named: "BlackBox"),
            let node = scene.rootNode.childNode(withName: "BlackBox", recursively: false) else { return SCNNode() }
        let scaleFactor  = 0.7
        node.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
        node.eulerAngles.x += -.pi / 2
        return node
    }()
    
    func resetTrackingConfiguration() {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        let config = ARWorldTrackingConfiguration()
        config.detectionImages = referenceImages
        let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
        sceneView.session.run(config, options: options)
       // label.text = "Move camera around to detect images"
    
}
    
    
    func TrackingConfiguration(){
        guard let refernceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else{ return }
        let config = ARWorldTrackingConfiguration()
        config.detectionImages = refernceImages
        let options : ARSession.RunOptions = [.removeExistingAnchors ]
        sceneView.session.run(config, options: options )
        
        
    }
    
    
    
    func GetPlayerName() {//初始載入名字的資料
        test[0] = test[0] + playdata.GetName() + "嗎"
        gamerName = playdata.GetName()

    }//end of GetPlayerName
    
    //取得名字
    func NameText() ->String{
        var name : String!
        
        if(conversation == 2 && conversationCheck == false){
            let temp = conversation2[index].components(separatedBy: " ")
            print("conversation00對話內容 : \(temp)")
            name = temp[0]  //字串分割結果 名字為[0] 文本為[1]
            return name
        }else if(conversation == 2 && conversationCheck == true){
            return name ?? "艾里西斯伊莉絲"//不知為何名字會不見
        }
        
        if(conversation == -1 && conversationCheck == false){
            let temp = conversation00[index].components(separatedBy: " ")
            print("conversation00對話內容 : \(temp)")
            name = temp[0]  //字串分割結果 名字為[0] 文本為[1]
            return name
        }else if(conversation == -1 && conversationCheck == true){
            return name ?? "艾里西斯伊莉絲"//不知為何名字會不見
        }
        
        if(conversation == 1 && conversationCheck == false){
            let temp = conversation1[index].components(separatedBy: " ")
            print("conversation1對話內容 : \(temp)")
            name = temp[0]  //字串分割結果 名字為[0] 文本為[1]
            return name
        }else if(conversation == 1 && conversationCheck == true){
            return name ?? "艾里西斯伊莉絲"//不知為何名字會不見
        }
        
        if(missionData.missionIntegrate[4].isComplete == true){
            let temp = test4[index].components(separatedBy: " ")
            print("test4對話內容：\(temp)")
            name = temp[0]
            return name
        }else if(missionData.missionIntegrate[3].isComplete == true){
            let temp = test3[index].components(separatedBy: " ")
            print("test3對話內容：\(temp)")
            name = temp[0]
            return name
        }else if(missionData.missionIntegrate[2].isComplete == true){
            let temp = test2[index].components(separatedBy: " ")
            print("test2對話內容：\(temp)")
            name = temp[0]
            return name
        }else if(missionData.missionIntegrate[1].isComplete == true){
            let temp = test1[index].components(separatedBy: " ")
            print("test1對話內容 : \(temp)")
            name = temp[0]  //字串分割結果 名字為[0] 文本為[1]
            return name
        }else {
            let temp = test[index].components(separatedBy: " ")
            print("test對話內容 : \(temp)")
            name = temp[0]  //字串分割結果 名字為[0] 文本為[1]
            return name
        }
        
    }
    
    //從文本中刪除多餘的名字
    func DeleteNameText()-> [String]{
        let name = NameText()
        print("namecount : \(name.count)")
        
        if(conversation == 2 && conversationCheck == false){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                conversation2[index].remove(at: name.startIndex)
            }
            return conversation2
            
        }else if (conversation == 2 && conversationCheck == true){
            print("對話測試 ： \(conversation1)")
            return conversation2
        }
        
        if(conversation == -1 && conversationCheck == false){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                conversation00[index].remove(at: name.startIndex)
            }
            return conversation00
            
        }else if (conversation == -1 && conversationCheck == true){
            print("對話測試 ： \(conversation1)")
            return conversation00
        }
        
        if(conversation == 1 && conversationCheck == false){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                conversation1[index].remove(at: name.startIndex)
            }
            return conversation1
            
        }else if (conversation == 1 && conversationCheck == true){
            print("對話測試 ： \(conversation1)")
            return conversation1
            
        }else if(missionData.missionIntegrate[4].isComplete == true){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                test4[index].remove(at: name.startIndex)
            }//end of test4 loop
            return test4 //此字串為任務完成後再用的
            
        }else if(missionData.missionIntegrate[3].isComplete == true){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                test3[index].remove(at: name.startIndex)
            }//end of test3 loop
            return test3 //此字串為任務完成後再用的
            
        }else if(missionData.missionIntegrate[2].isComplete == true){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                test2[index].remove(at: name.startIndex)
            }//end of test2 loop
            return test2 //此字串為任務完成後再用的
            
        }else if(missionData.missionIntegrate[1].isComplete == true && conversation == 0){
            for _ in 0...(name.count - 1){ //看名字多長便刪除幾個字(名字)
                test1[index].remove(at: name.startIndex)
                //如果對話完成就把conversation強制改為1
                if(index == test1.count ){ //因為index會從1開始，似乎無法等同於test1的長度
                    conversation = 1
                }
                print("確認額外對話 ：\(conversation)")
                
            }//end of test1 loop
            return test1 //此字串為任務完成後再用的
            
        }else if (conversation == 0){
            for _ in 0...(name.count - 1)  { //看名字多長便刪除幾個字(名字)
                test[index].remove(at: name.startIndex)
            }//end of test loop
        }
        return test
    }
    
    
    private func CoverButton() {
        mapButton.alpha = 0
        missionButton.alpha = 0
        backpackButton.alpha = 0
        pictureButton.alpha = 0
        photoButton.alpha = 0
        
    }//隱藏按鈕,若需顯示對話框或擷取螢幕都可適用
    private func DiscoverButton() {
        mapButton.alpha = 1
        missionButton.alpha = 1
        backpackButton.alpha = 1
        pictureButton.alpha = 1
        photoButton.alpha = 1
        
    }
    
    private func DiscoverScript(){
        textView.index = 1
        self.index = 1
        textView.alpha = 1
        //textView.TextContain(playerName: [NameText()], scriptName: DeleteNameText())//避免重複顯示先前的文字
        //textView.Animations()
    }
    
   

    private func UpIndexandAnimation(){
        textView.index += 1
        self.index += 1
        textView.Animations()
    }
    
    private func ResetConversationCheck(){
        conversation = 0 //強制不進行任何額外對話
        fairyTalk = false
        if(missionData.missionIntegrate[4].isComplete == true){
            conversationCheck = false //額外對話的字串切割，判定重置
            callFairyTime = false
        }
        
    }
    
    @IBAction func touchScriptView(_ sender: UITapGestureRecognizer) {//對話框點擊觸發,以下alpha（不透明度）設置條件應再修正
        if(touchTime == false){
            
            //由於此判斷有些bug，因此增加長度避免文字未輸出完便結束對話
            if((textView.index < test.count + 50) ){
                if(self.index == 0){//必須要初始載入對話框架
                    textView.alpha = 1
                    textView.FirstTextLoad(name: [NameText()], textname: DeleteNameText())
                }else{
                    textView.TextContain(playerName: [NameText()], scriptName: DeleteNameText())
                }//end of else
                
            }//end of if textView.index < test.count
            UpIndexandAnimation()
            
            if( textView.index == test.count ){
                    MissionAlert()
                    touchTime = true
                }
            
            
            
            if(missionData.missionIntegrate[1].isAcception == true && missionData.missionIntegrate[4].isComplete == false && textView.index == conversation1.count){
                    touchTime = true
                }
            if(missionData.missionIntegrate[4].isComplete == true && textView.index == conversation2.count){
                touchTime = true
            }
            
            if(fairyTalk == true){
                //若第一個任務沒接的話
                if(firstMissionisAcception == false && textView.index == conversation00.count ){
                    MissionAlert()
                    touchTime = true
                }
            }
            
            //避免與精靈對話到一半便關閉對話框
            if(fairyTalk == false){
                
                if( missionData.missionIntegrate[1].isComplete == true && textView.index == test1.count && missionData.missionIntegrate[2].isComplete == false ){
                    touchTime = true
                }//關閉test1對話框判定，（任務一必須已完成）
                if(missionData.missionIntegrate[2].isComplete == true && textView.index == test2.count && missionData.missionIntegrate[3].isComplete == false){
                    touchTime = true
                }
                if(missionData.missionIntegrate[3].isComplete == true && textView.index == test3.count && missionData.missionIntegrate[4].isComplete == false ){
                    touchTime = true
                }
                if(missionData.missionIntegrate[4].isComplete == true && textView.index == test4.count){
                    touchTime = true
                }
            }
            
            
            //end of if
            
            CoverButton()
            
            //關閉對話框判定,未來可修正
        } else if (touchTime == true ) {
            textView.alpha = 0
            textView.stopAnimation()
            DiscoverButton()
            CoverModel()
            touchTime = false
        }
    }

    private func MissionAlert(){
        let Missionalert = UIAlertController(title: nil, message: "是否要接取任務?", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "是", style:.default, handler :{
            (action :UIAlertAction!)->Void in print("接取任務")
            self.firstMissionisAcception = true
            
                self.callFairyTime = false
                self.conversationCheck = false
            //避免與精靈對話，名字依然沒被刪除
            //self.test.append("艾里西斯伊莉絲 謝啦")
            self.textView.index = 0 
            self.textView.TextContain(playerName: ["艾里西斯伊莉絲"], scriptName: ["謝啦！"])
            self.textView.Animations()
            self.missionData.MissionAccept()//任務1接受
            self.missionData.MissionAccept()//任務2接受
            self.missionData.MissionAccept()//任務3接受
            self.missionData.MissionAccept()//任務4接受
            print("任務序號：\(self.missionData.missionID)")
            //self.playdata.NotFirstGamer()//確認不是第一次玩 ,暫時用不上
            
            
        })
        Missionalert.addAction(acceptAction)
        
        let rejectAction = UIAlertAction(title: "否", style: .destructive){ _ in
            self.test.append("艾里西斯伊莉絲 喔，這樣啊，那你慢慢享受吧")
            self.textView.TextContain(playerName: [self.NameText()], scriptName: self.DeleteNameText())
            //第二次問你時若再不答應便閃退ｗｗ
            self.textView.Animations()
           // self.missionData.count = 0
           // print(self.missionData.count)
        }
        Missionalert.addAction(rejectAction)

        present(Missionalert , animated: true)
    }
    private func RecognizeAlert(){
        let Recognizealert = UIAlertController(title: nil, message: "已獲取物品", preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "OK", style: .destructive){ _ in
            print("獲取成功")
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (timer) in
                self.ResetModel()
                self.Model()
                self.ResetConversationCheck() //強迫不觸發額外對話
                self.CoverButton()
                self.DiscoverScript()
                // do stuff 0.9 seconds later
            }
            RunLoop.current.add(timer, forMode: .default)
        }
        Recognizealert.addAction(checkAction)
        present(Recognizealert , animated: true)
    }
}


extension UIView {
    //将当前视图转为UIImage
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

extension UIColor {
    open class var transparentLightBlue: UIColor {
        return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.50)
    }
}

extension ViewController {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            guard let imageAnchor = anchor as? ARImageAnchor,
                let imageName = imageAnchor.referenceImage.name else { return }
            
            
            let overlayNode = self.getNode(withImageName: imageName)
            overlayNode.opacity = 0
            overlayNode.position.y = 0.2
            overlayNode.runAction(self.fadeAndSpinAction)
            node.addChildNode(overlayNode)
            
            //self.label.text = "Image detected: \"\(imageName)\""
        }
    }
    
    
    func getPlaneNode(withReferenceImage image: ARReferenceImage) -> SCNNode {
        let plane = SCNPlane(width: image.physicalSize.width,
                             height: image.physicalSize.height)
        let node = SCNNode(geometry: plane)
        return node
    }
    
    
    func getNode(withImageName name: String) -> SCNNode {
        var node = SCNNode()
        switch name {
        case "Book":
            if(missionData.missionIntegrate[1].isAcception == true && missionData.missionIntegrate[1].isComplete == false ){
                node = bookNode
                RecognizeAlert()
                missionData.ReportMission(name: "找尋Ｃ語言相關物件")
                playdata.SavePoint() //儲存點,之後可取得其point資料方便做對話框判定
                
                //test += test1 //方法一 合成字串陣列後輸出對話內容
                //方法二 直接以新的字串陣列輸出對話內容,畢竟..任務完成了,對吧？
                print("\(missionData.missionIntegrate[1])")
                /*
                ResetConversationCheck() //強迫不觸發額外對話
                CoverButton()
                DiscoverScript()
                let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                    self.ResetModel()
                    self.Model()
                    // do stuff 0.5 seconds later
                }
                RunLoop.current.add(timer, forMode: .default)
                */
            }
            

            
        case "OPA":
            if(missionData.missionIntegrate[2].isAcception == true && missionData.missionIntegrate[1].isComplete && missionData.missionIntegrate[2].isComplete == false){
                node = OPANode
                RecognizeAlert()
                missionData.ReportMission(name: "放大器")
                
                print("\(missionData.missionIntegrate[2])")
                
                
            }
            
        case "BlackBox":
            
            if(missionData.missionIntegrate[3].isAcception == true
                && missionData.missionIntegrate[1].isComplete == true
                &&
                missionData.missionIntegrate[2].isComplete == true
                &&
                missionData.missionIntegrate[3].isComplete
                == false
                 ){
            node = blackBoxNode
            RecognizeAlert()
                missionData.ReportMission(name: "黑盒子")
                print("\(missionData.missionIntegrate[3])")
                
            }
            
            
        case "CarKey":
            if(missionData.missionIntegrate[4].isAcception == true
                && missionData.missionIntegrate[1].isComplete == true
                &&
                missionData.missionIntegrate[2].isComplete == true
                &&
                missionData.missionIntegrate[3].isComplete
                 == true
                &&
                missionData.missionIntegrate[4].isComplete == false ){
                node = CarKeyNode
                RecognizeAlert()
                missionData.ReportMission(name: "車鑰匙")
                print("\(missionData.missionIntegrate[4])")
                
            }
            
            
        default:
            break
        }
        return node
    }

}


