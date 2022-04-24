//
//  HistoryViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/24/22.
//

import UIKit
import qris_sdk_astrapay
class HistoryViewController: UIViewController {

    @IBOutlet weak var toQrisPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
        // Do any additional setup after loading the view.
    }
    
    func setupButton(){
        self.toQrisPage.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        DispatchQueue.main.async {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: QRViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
}
