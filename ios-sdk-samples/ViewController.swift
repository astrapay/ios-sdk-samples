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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSDK()
        self.setupButton()
    }
    func setupSDK(){
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1NjQxNjU5MiwiZXhwIjoxNjU2NDIwMTkyLCJpYXQiOjE2NTY0MTY1OTIsImp0aSI6IjRkNjVlMWM0LTE5NjEtNGFkZS05ZGU1LTc1MDllYzMyNjYzMiIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.goA-pyU_E8vKefcBe33VxRpY4xLKDyQgGSN7Zif25sizs5LCCZow9EUcs34CgR_-SY29mWyfsmkihJ6T7QfS8XYcaADDZ4eFxxJnIAhHtf8yHu6JwLAhHbDCRu-fLvjbTh_uwuyLHzpATekzpFq-zfgpkgHUFS-eutK0weo6X4AF5SZAZDktLbY4z_YkJF2rudR6NCpVKyOlA6L6vZi1hIWlfBbqRX303TIWoOjUaeg4D4kRdsyo1_DeIx00i4uSqZk2Z-5ZS9cnmlWMpBA8l5cq_DtcBFEXvc4X9C1rsCl3W-6m-OSqN45ie5iWSTzorKSQ1tBU-ZWTLgBSIABurA"
        QRConfigurationSdk.BUILD_MODE = .uat
        QRConfigurationSdk.SDK_TOKEN = "b983e0e72dd81d804262b9f1a7973ea11a2149df"
        QRNewRouter.sharedInstance.delegate = self
        
    }

    func setupButton(){
        self.qrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        //self.router?.navigateToQrScan(from: self)
        QRNewRouter.sharedInstance.navigateToQrScan(from: self)
//        self.navigationController?.pushViewController(WebTopUpViewController(nibName: "WebTopUpViewController", bundle: Bundle(identifier: "com.astrapay.ios-sdk")), animated: true)
        print("is clicked")
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

