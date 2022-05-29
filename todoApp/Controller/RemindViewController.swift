//
//  RemindViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/22.
//

import UIKit
import RealmSwift
import NotificationCenter

class RemindViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    var itemList:Results<TodoItem>!
    var token:NotificationToken!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        itemList = realm.objects(TodoItem.self).sorted(byKeyPath: "date")
        token = realm.observe{ notification, realm in
            
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 165/255, green: 212/255, blue: 173/255, alpha: 1.0)
            
            self.tableView.reloadData()
        }
    }
    
}

extension RemindViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! MainTableViewCell
        let item = itemList[indexPath.row]
        cell.medicineField?.text = item.name
        cell.timeField?.text = infoHelper().dateToTimeString(date: item.date)
        cell.mainBackground.layer.cornerRadius = 10
        cell.item = item
        if cell.item?.isTakenMedicine == false {
            cell.takenButton.setTitle("服用", for: .normal)
        } else {
            cell.takenButton.setTitle("✅", for: .normal)
            cell.takenButton.isEnabled = false
        }
        cell.indexPath = indexPath
        cell.mainTableViewCellDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
}

extension RemindViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension RemindViewController: MainTableViewCellDelegate {
    
    func taking(item: TodoItem) {
        let judgeVC = self.storyboard?.instantiateViewController(withIdentifier: "judgeView") as! JudgeViewController
        judgeVC.selectedMedicine = item.name
        self.present(judgeVC, animated: true, completion: nil)
        try! realm.write {
            item.isTakenMedicine = true
        }
        
    }
    
    func edit(indexPath: IndexPath) {
        let item = itemList[indexPath.row]
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modalView") as! ModalViewController
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        modalVC.editingMedicineName = "\(item.name)を選択中"
        modalVC.deleteCellDelegate = self
        modalVC.indexPath = indexPath
        modalVC.item = item
        
        present(modalVC, animated: true, completion: nil)
    }
}

extension RemindViewController: DeleteCellDelegate {
    func deleteCell(indexPath: IndexPath) {
        infoHelper().deleteItem(item: itemList[indexPath.row], token: token)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        dismiss(animated: true)
    }
}



