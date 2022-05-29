//
//  RegisterMedicineController.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/22.
//

import UIKit
import RealmSwift

class RegisterMedicineViewController: UIViewController {
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var medicineSaveButton: UIButton!
    @IBOutlet weak var timeField: UITextField!
    
    let realm = try! Realm()
    var toolBar: UIToolbar!
    let datePickerView:UIDatePicker = UIDatePicker()
    
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
    
    @IBAction func addMedicine(_ sender: Any) {
        if let itemField = itemField {
            infoHelper().save(name: itemField.text!, date: datePickerView.date, isTaken: false)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
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

extension RegisterMedicineViewController: UITextFieldDelegate {
    
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

        //datepickerが選択されたらtextfieldに表示
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";
        timeField.text = dateFormatter.string(from: sender.date)
    }

    @objc func doneBtn(){
        timeField.resignFirstResponder()
    }
}
