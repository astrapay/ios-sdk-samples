//
//  ViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/21/22.
//

import UIKit
import ios_sdk
class ViewController: UIViewController, QRProtocolSdk{
    
    func onCancel(viewController: UIViewController) {
        let loginVC = LoginViewController()
        viewController.navigationController?.pushViewController(loginVC, animated: true)    }
    
    func onComplete(viewController: UIViewController) {
        let homeVC = HomeViewController()
        viewController.navigationController?.pushViewController(homeVC, animated: true)
    }

    func onForbidden(viewControler: UIViewController) {
        let loginVC = LoginViewController()
        viewControler.navigationController?.pushViewController(loginVC, animated: true)
    }

    func onShowHistory(viewController: UIViewController) {
        let historyVC = HistoryViewController()
        viewController.navigationController?.pushViewController(historyVC, animated: true)
    }
    
    func onProcessing(viewController: UIViewController){
        let processing = GeneralViewController(textPage: "Processing Page")
        viewController.navigationController?.pushViewController(processing, animated: true)
    }
    
    func onFailed(viewController: UIViewController){
        let failedPage = GeneralViewController(textPage: "Failed Page")
        viewController.navigationController?.pushViewController(failedPage, animated: true)
    }


    
//    var router: QRNewRouterSdk?
    @IBOutlet weak var qrisButton: UIButton!
    //var router: QRNewRouter?
    @IBOutlet weak var webviewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSDK()
        self.setupButton()
    }
    func setupSDK(){
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODk1MDY5NzQyMDMiLCJuYmYiOjE2NTcwOTc3MzgsImlzcyI6IkFzdHJhUGF5LURldiIsImNsYWltIjoiTUVSQ0hBTlQiLCJleHAiOjE2NTcxMDEzMzgsInR5cGUiOiJBQ0NFU1MiLCJpYXQiOjE2NTcwOTc3MzgsInVzZXJJZCI6MTk5NjczLCJqdGkiOiI3NDkxY2RhZC01Y2NiLTQzM2UtYjQwOC1kMTBlNTRjN2M3ZmMiLCJlbWFpbCI6Imt1bGlfY29kaW5nQG1haWwuY29tIn0.YRthKoSWltLUsFMDsB0HtPQ2Fo13whAf3SMXF9uZN7hqVb4KtDZhw8SCuXJOYS6baHjgAGArE6ZAbCz8n8IfeEON46-bBP10ZQQGuJNhAQL3imb6UHistax96rstaZeJdd1CwfU7p2MuoMGOzCY651VAv7XPqCdn8rtFOvTz6qveNa7bn-pkxgsAgb62IEQlZhKQj6z8PFurFlOdjt6IMvBGgoRiQnI4gBf9Ti467siTDEkCKZatoyYCy48Oid5mcUQAFYkxX_OUwS95EhSI3Cs6iQrIMs2ypLSMTD-8VGo25Xnv1uLBYeguUGr09R7ElmWbhcxlE4Kq-GrPhHenwA"
        QRConfigurationSdk.BUILD_MODE = .uat
        QRConfigurationSdk.SDK_TOKEN = "b983e0e72dd81d804262b9f1a7973ea11a2149df"
        QRNewRouter.sharedInstance.delegate = self
        
    }

    func setupButton(){
        self.qrisButton.addTarget(self, action: #selector(buttonActionQris), for: .touchDown)
        self.webviewButton.addTarget(self, action: #selector(buttonActionWebview), for: .touchDown)
    }

    
    @objc func buttonActionQris(){
        QRNewRouter.sharedInstance.navigateToQrScan(from: self)
    }
    
    @objc func buttonActionWebview(){
        WebviewRouter.sharedInstance.navigateToWebviewRouter(self)
    }
}
//
//extension ViewController: QRConfigurationSdkDataSource{
//    var authenticationToken: String? {
//        return   "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1MDk4ODgzOSwiZXhwIjoxNjUwOTkyNDM5LCJpYXQiOjE2NTA5ODg4MzksImp0aSI6ImYwY2EwMDk3LWRkNzgtNDY3Mi04Y2Y1LTJmOTdhZWJlNTNhMyIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.BnqNhJXVtXilUYUuGvtp8v5LDs8UEuDVJCCZqtDDOPMhgmzzDqfL6bnriVVUnD82N3pOzv-CteATuc8eAogqMUcbr0F49dZAGgMMe1wrlOJ2kQMUrdqALxgUE2I1S6kbvs35PxOfpNJEn2daRF4Hfe1Jg9O08GzxnnYGmnR8jDbTT609xD1y38QGLGLkvpyag2vFdQCzOeWMMTAgX62wznhgMOgFU4DPvPczPkBo6kmIUY8HG5PNgFhIcx3O1YMLnwHFOXx6vimOvl812kEg-RGQCv1W_xd2oqEocLjZ4NkxVAAnsF5jUc3q_IdVEGGRoNyp4Ooo38aDOXweX9NUfQ"
//    }
//
//    var buildMode: BuildMode? {
//        return .sit
//    }
//
//}

