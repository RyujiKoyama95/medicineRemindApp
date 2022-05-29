//
//  EditMedicineViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2022/01/15.
//

import UIKit
import RealmSwift

class EditMedicineViewController: UIViewController {
    @IBOutlet weak var itemField: CustomitemField!
    @IBOutlet weak var timeField: CustomtimeField!
    
    let realm = try! Realm()
    let datePickerView:UIDatePicker = UIDatePicker()
    var itemList:Results<TodoItem>!
    var toolBar:UIToolbar!
    var indexPath: IndexPath?
    var item: TodoItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeField.delegate = self
        setupToolbar()
        
        //        newItemField = itemField.text!
        //        newTimeFiels = timeField.text!
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateAction(_ sender: Any) {
        updateCell(indexPath: indexPath!)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
        print("editActionが呼ばれた")
    }
    
    func updateCell(indexPath: IndexPath) {
        try! realm.write {
            item.name = itemField.text!
            item.date = datePickerView.date
        }
        print("updateCellが呼ばれた")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension EditMedicineViewController: UITextFieldDelegate {
    
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
