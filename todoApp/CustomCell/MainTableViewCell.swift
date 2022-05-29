//
//  MainTableViewCell.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/28.
//

import UIKit
import RealmSwift

protocol MainTableViewCellDelegate {
    func taking(item: TodoItem)
    func edit(indexPath: IndexPath)
}

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var timeField: UILabel!
    @IBOutlet weak var medicineField: UILabel!
    @IBOutlet weak var mainBackground: UIView!
    @IBOutlet weak var takenButton: UIButton!
    
    let realm = try! Realm()
    var mainTableViewCellDelegate: MainTableViewCellDelegate?
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var selectMedicine = ""
    var itemMedicine = ""
    var item: TodoItem?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.daychanged), name: UIApplication.significantTimeChangeNotification, object: nil)
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func daychanged() {
        if !item!.isInvalidated {
            try! realm.write {
                item?.isTakenMedicine = false
            }
            print("daychangedが呼ばれた")
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        if let item = item {
            mainTableViewCellDelegate?.taking(item: item)
            print("addActionが呼ばれた")
        }
    }
    
    @IBAction func toEditMenu(_ sender: Any) {
        if let indexPath = indexPath {
            mainTableViewCellDelegate?.edit(indexPath: indexPath)
                print("toEditMenuが呼ばれた")
        }
    }
    
}
