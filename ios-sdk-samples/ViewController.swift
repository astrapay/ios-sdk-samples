//
//  ViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/21/22.
//

import UIKit
import qris_sdk_astrapay
class ViewController: UIViewController, QRNewRouterProtocol {
    func didGoBackToHome(viewController: UIViewController) {
        var homeVC = HomeViewController()
        viewController.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func didUnAuthorized(viewControler: UIViewController) {
        var loginVC = LoginViewController()
        viewControler.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func didGoToHistoryList(viewController: UIViewController) {
        print("Did go to history")
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
    }
}

extension ViewController: QRConfigurationSdkDataSource{
    var authenticationToken: String? {
        return "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiIwODU3NzA0NDIyOTgiLCJyb2xlcyI6WyJMT0dJTiJdLCJpc3MiOiJBc3RyYVBheS1EZXYiLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjoxOTk4NTQsImRldmljZUlkIjoiMTIzIiwidHJhbnNhY3Rpb25JZCI6IiIsInRyYW5zYWN0aW9uVHlwZSI6IiIsIm5iZiI6MTY1MDgwODE4OCwiZXhwIjoxNjUwODExNzg4LCJpYXQiOjE2NTA4MDgxODgsImp0aSI6IjE5MGVkN2E3LTQ2ZDctNDcxMy1iYzM2LTk5NGMxZGEwNjM5ZiIsImVtYWlsIjpbImdpbGJlcnQuc3ViYXlAYXN0cmFwYXkuY29tIl19.NezwuafO_gc8RGTZEtkYR1wtdUDldJYii2qBfRbzcsjyPXN2YZCHbhKYj3SMIvwh3cjyc02L2HSbxaxlzm_s9sTlRh-OAJZabUDUZynkz0AJVMQ9bZQWBVgh-AognojfZ2RL5gPQRIzWdeBDBtHK_ZlrfCSE5AtLOPNbXYgi8_5SrCXrVJlsNJnxXQb1oJJtmm4xlHjI7w8dQ4HmQU9MwWdCKjFUzZ6KJsZNGmPeZtVwvThwSS2zQmjvsYgxpuSCbQyJXJHqGYp5WHKbTvbuWS6X9MxOFpq2KFXjZrQ-P8QAZUZt12ImnhMUbR2w3DTVacubIFHvtnzIz-4T3RlPyA"
    }
    
    var buildMode: BuildMode? {
        return .sit
    }

}

