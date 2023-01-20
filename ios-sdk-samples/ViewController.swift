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

        //optional
        let loginVC = LoginViewController()
        viewController.navigationController?.pushViewController(loginVC, animated: true)
    }
    
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


    @IBOutlet weak var webViewButton: UIButton!
    
//    var router: QRNewRouterSdk?
    @IBOutlet weak var qrisButton: UIButton!
    //var router: QRNewRouter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSDK()
        self.setupButton()
    }
    func setupSDK(){
//        var sadasd = QRDetailPaymentTVCellAstrapay
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODEyODQ3NjgxMjMiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoyMDAxMDMsInRyYW5zYWN0aW9uSWQiOiIiLCJ0cmFuc2FjdGlvblR5cGUiOiIiLCJhY2NvdW50SWQiOjczNywiYWNjb3VudElkUG9pbnQiOjAsIm5iZiI6MTY3MTc2Mjk2OSwidXNlclR5cGUiOiJDVVNUT01FUiIsImV4cCI6MTY3MTc2NjU2OSwiaWF0IjoxNjcxNzYyOTY5LCJqdGkiOiJlZDQ0ZTFkYy1hNTBlLTQ4NDgtYjg5ZC1hODEzN2EzOTIwYzkiLCJlbWFpbCI6WyJzeWRuZXlhaG5hM0BnbWFpbC5jb20iXX0.TXF4mVzIaV3yuaAQp7NH7xv4Opk95y8DVwwWS98F103roOZdtsEUol6c9o8tio7TrvWNHjTqjebi18eCgy1d244eY-6-toSI5nPCVHXMJqDVDLQmWobfPGifkXghD2EJ3Dn3GrFx6mf2FRJzp3HvhimqmknFvK20P1iYqmX04WGmBK6zadSJjINlgNt0Czc8-PKhw4I9zkM7Puqusd1D-XgAEVJjk9lJUwjTN8R6JsY_tA4kDfotTmH54e0GaSZFAdRYK_P08X068XaYE1PYwqa66xuTBmKFvfOmg6ZIWgw9o9zM-Vil_cW_G2SG0hfXTbl3sLW9xTlYGZAdIpsVwA"
        QRConfigurationSdk.BUILD_MODE = .uat
        QRConfigurationSdk.SDK_TOKEN = "XTOKEN"
        QRNewRouter.sharedInstance.delegate = self

        
    }

    func setupButton(){
        self.qrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        self.webViewButton.addTarget(self, action: #selector(webViewButtonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        //self.router?.navigateToQrScan(from: self)
        QRNewRouter.sharedInstance.navigateToQrScan(from: self)
//        self.navigationController?.pushViewController(WebTopUpViewController(nibName: "WebTopUpViewController", bundle: Bundle(identifier: "com.astrapay.ios-sdk")), animated: true)
        print("is clicked")
    }
    
    @objc func webViewButtonAction(){
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

