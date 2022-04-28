//
//  ViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/21/22.
//

import UIKit
import ios_sdk
class ViewController: UIViewController, QRNewRouterProtocol {
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
    var router: QRNewRouter?
    var qrConfigurationSdk: QRConfigurationSdk = QRConfigurationSdk()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.qrConfigurationSdk.delegateSdk = self
        self.setupRouter()
        self.setupButton()

    }
    
    
    func setupRouter(){
        self.router = QRNewRouter.qrNewRouterShared
        self.router?.delegate = self
    }

    func setupButton(){
        self.qrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        QRNewRouter.navigateToQrScan(from: self)
        self.qrConfigurationSdk.execute()
        print("is clicked")
    }
}

extension ViewController: QRConfigurationSdkDataSource{
    var authenticationToken: String? {
        return   "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1MDk4ODgzOSwiZXhwIjoxNjUwOTkyNDM5LCJpYXQiOjE2NTA5ODg4MzksImp0aSI6ImYwY2EwMDk3LWRkNzgtNDY3Mi04Y2Y1LTJmOTdhZWJlNTNhMyIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.BnqNhJXVtXilUYUuGvtp8v5LDs8UEuDVJCCZqtDDOPMhgmzzDqfL6bnriVVUnD82N3pOzv-CteATuc8eAogqMUcbr0F49dZAGgMMe1wrlOJ2kQMUrdqALxgUE2I1S6kbvs35PxOfpNJEn2daRF4Hfe1Jg9O08GzxnnYGmnR8jDbTT609xD1y38QGLGLkvpyag2vFdQCzOeWMMTAgX62wznhgMOgFU4DPvPczPkBo6kmIUY8HG5PNgFhIcx3O1YMLnwHFOXx6vimOvl812kEg-RGQCv1W_xd2oqEocLjZ4NkxVAAnsF5jUc3q_IdVEGGRoNyp4Ooo38aDOXweX9NUfQ"
    }
    
    var buildMode: BuildMode? {
        return .sit
    }

}

