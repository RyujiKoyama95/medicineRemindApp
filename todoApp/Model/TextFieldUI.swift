//
//  TextFieldUI.swift
//  todoApp
//
//  Created by 小山竜二 on 2022/01/13.
//

import Foundation
import UIKit


class CustomitemField: UITextField {
    
    let underline: UIView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.frame.size.height = 70
        
        composeUnderline()
        
        self.borderStyle = .none
        self.placeholder = "薬の名前"
    }
    
    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,
            y: self.frame.height,
            width: self.frame.width,
            height: 2.5)
        
        self.underline.backgroundColor = UIColor(red:76/255, green:175/255, blue:147/255, alpha:1.0)
        
        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
        
    }
}


class CustomtimeField: UITextField {
    
    let underline: UIView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.frame.size.height = 70
        
        composeUnderline()
        
        self.borderStyle = .none
        self.placeholder = "通知する時間"
    }
    
    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,
            y: self.frame.height,
            width: self.frame.width,
            height: 2.5)
        
        self.underline.backgroundColor = UIColor(red:76/255, green:175/255, blue:147/255, alpha:1.0)
        
        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
        
    }
}
