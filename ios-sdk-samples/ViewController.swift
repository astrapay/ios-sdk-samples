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
        QRConfigurationSdk.AUTH_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1NTgwOTQ1NywiZXhwIjoxNjU1ODEzMDU3LCJpYXQiOjE2NTU4MDk0NTcsImp0aSI6ImU2NjdlNjMwLTU0YjQtNGIzZS1iMWMwLTM5NGI3MmU1NjI3OCIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.MhygTVbWfTlSbKxypqUrT8IHP87xKIal3rd4Q7pCTftmDrWIF31PGL8pOQ4Nd1aBelEhK2mbAbkDFAVbzItsd2LGdQ_nfnJH5rac2KDd6xN0WxXl07e3VMskgBMrlGtedhMHhx4IMdkcC6uXn5ezmnDbPNL5DpykcAsPbQWe8DE1VZrd_3OoUyHhwyd30Rtau20LIa61Hnv5gpUwQXplHR7oUJn6L875agKF5WzDEHhP2-hV-auPV7s6KJQZgdNdyMz_EFcMkgi9X_NhIWerfCRJkVlZBO6nfrsVvfYLqsx6IEHZD5Hg35JxjmBs1DRL20UNBiy01LIMf9PMlOR0Jg"
        QRConfigurationSdk.BUILD_MODE = .uat
        QRNewRouter.sharedInstance.delegate = self
    }

    func setupButton(){
        self.qrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        //self.router?.navigateToQrScan(from: self)
        QRNewRouter.sharedInstance.navigateToQrScan(from: self)
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

