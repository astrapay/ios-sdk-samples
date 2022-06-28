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
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1NjQxMjkzOCwiZXhwIjoxNjU2NDE2NTM4LCJpYXQiOjE2NTY0MTI5MzgsImp0aSI6IjdjYjQwNmU3LWVhNzYtNDlmZC1iZTkyLTZlM2EzODcyYjAzYiIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.G8pHYJ-IEr_mpSXJEzzPEgxzhZqfuqCPsi59D1CAsJxjAQ_Xt7eKq72O9VGX9D1wQi65cQy60wgezdeUHy74D8uaevasbAm0mBSB1-PjWqPO3rqpqeo9MU8oLTXXAAKZ38ASwbufrMwgfLAXyhVKeVw8wC4vQzCK9ywLgdOvuUzTfaKYas4Yk4hdRF9ZAS3phzPgc9IouQV7Q_0Q0QScgb5KVo9btjGXmaG8s8rMu0UGLIbA6CLmzEKlF9aCNqRJ-dkG-RkCPfiCmwUsC7ZsqxYD0ewr1_M8exPmFLCKZVoz7EgBq7RUN1UkD3sWVz1kIMInAQh2LdSYDirSNIcL3Q"
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

