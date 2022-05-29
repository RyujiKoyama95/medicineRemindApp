//
//  ResultViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2022/01/14.
//

import UIKit

class ResultViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var resultIconField: UILabel!
    @IBOutlet weak var resultTextField: UILabel!
    @IBOutlet weak var lastTextField: UILabel!
    
    var resultIcon = ""
    var resultText = ""
    var lastResultText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultIconField.text = resultIcon
        resultTextField.text = resultText
        lastTextField.text = lastResultText
        
        resultTextField.textColor = UIColor.white
        lastTextField.textColor = UIColor.white
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            dismiss(animated: true, completion: nil)
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }

}
    
}
