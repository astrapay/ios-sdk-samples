//
//  GeneralViewController.swift
//  ios-sdk-samples
//
//  Created by Gilbert on 6/28/22.
//

import UIKit

class GeneralViewController: UIViewController {
    
    let label = UILabel()
    let toQrisButton = UIButton()
    
    var textPage: String = "General View Controller"
    
    convenience init(textPage: String) {
        self.init()
        self.textPage = textPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
    func style(){
        self.view.backgroundColor = .white
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = textPage
        self.label.textColor = .systemPurple
        
        //button
        self.toQrisButton.translatesAutoresizingMaskIntoConstraints = false
        self.toQrisButton.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        self.toQrisButton.setTitle("click to qris", for: .normal)
        self.toQrisButton.setTitleColor(UIColor.systemPurple, for: .normal)
    }
    
    func layout(){
        self.view.addSubview(label)
        self.view.addSubview(toQrisButton)
        
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            //buutton
            self.toQrisButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.toQrisButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
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

}
