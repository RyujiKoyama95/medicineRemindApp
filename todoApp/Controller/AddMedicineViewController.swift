//
//  EditMedicineViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/25.
//

import UIKit
import RealmSwift

class AddMedicineViewController: UIViewController {
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var medicineSaveButton: UIBarButtonItem!
    @IBOutlet weak var timeField: UITextField!
    
    let realm = try! Realm()
    let datePickerView:UIDatePicker = UIDatePicker()
    var toolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicineSaveButton.isEnabled = false
        
        timeField.delegate = self
        setupToolbar()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func itemFieldActionBtnInactive(_ sender: Any) {
        if itemField.text == "" {
            medicineSaveButton.isEnabled = false
        } else {
            medicineSaveButton.isEnabled = true
        }
    }
    
    @IBAction func addMedicineButton(_ sender: Any) {
        infoHelper().save(name: itemField.text!, date: datePickerView.date, isTaken: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }

}

extension AddMedicineViewController: UITextFieldDelegate {
    
    func setupToolbar() {

            toolBar = UIToolbar()
            toolBar.sizeToFit()
            let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneBtn))
            toolBar.items = [toolBarBtn]
            timeField.inputAccessoryView = toolBar
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView.datePickerMode = UIDatePicker.Mode.time
        datePickerView.preferredDatePickerStyle = .wheels
        textField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
    }


    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        timeField.text = dateFormatter.string(from: sender.date)
    }


    @objc func doneBtn(){
        timeField.resignFirstResponder()
    }
}
