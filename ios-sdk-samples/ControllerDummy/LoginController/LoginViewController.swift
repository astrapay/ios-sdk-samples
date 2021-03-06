//
//  LoginViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 4/24/22.
//

import UIKit
import ios_sdk

class LoginViewController: UIViewController {
    @IBOutlet weak var toQrisPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupButton()
        // Do any additional setup after loading the view.
    }
    
    func setupButton(){
        self.toQrisPage.addTarget(self, action: #selector(buttonAction), for: .touchDown)
    }

    
    @objc func buttonAction(){
        DispatchQueue.main.async {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: ViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
