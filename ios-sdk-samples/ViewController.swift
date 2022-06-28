//
//  ViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/21/22.
//

import UIKit
import ios_sdk
class ViewController: UIViewController, QRProtocolSdk{
    func didOnCancel(viewController: UIViewController) {
        let loginVC = LoginViewController()
        viewController.navigationController?.pushViewController(loginVC, animated: true)    }
    
    func didGoBackToHome(viewController: UIViewController) {
        let homeVC = HomeViewController()
        viewController.navigationController?.pushViewController(homeVC, animated: true)
    }

    func didUnAuthorized(viewControler: UIViewController) {
        let loginVC = LoginViewController()
        viewControler.navigationController?.pushViewController(loginVC, animated: true)
    }

    func didGoToHistoryList(viewController: UIViewController) {
        let historyVC = HistoryViewController()
        viewController.navigationController?.pushViewController(historyVC, animated: true)
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
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1NjMyNTIxMSwiZXhwIjoxNjU2MzI4ODExLCJpYXQiOjE2NTYzMjUyMTEsImp0aSI6ImQwYzkyODYzLTA0YWEtNDEzNC05Yzg0LWU2ZmUyNjE2YmQ4NCIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.Hhk_gWgO3W-HG0DFGFHVsuKPmXJtpko8KybBF-Wk_ESgt7qB6ZqjcTzgH5AHfcGEO99je88DqvvAP-vWxEZeVjQgCVwDhrn3B-awQKfkPfrZprLxKW03LS2Uu_UaFerBBNVND-JUPpc5V6YpQz0obe3sjoYNx9vXK5zlxJ-tMSuTyhqmO_s7X2lwid5G0a50zSFSk3D-NwMmiwh-yHcy9M4rFn3LdhekeCsCQNh50XjaX2qR4_ldpat3sHueNu9L10PvyxgGC4mowu6QVPIRUI8oxMPsE4Ck3KgTbiLM589uZllF1dRE8fTxZ8c5kob7cNVehpmp5lPVEByulN9L8w"
        QRConfigurationSdk.BUILD_MODE = .uat
//        QRConfigurationSdk.SDK_TOKEN = "b983e0e72dd81d804262b9f1a7973ea11a2149df"
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

