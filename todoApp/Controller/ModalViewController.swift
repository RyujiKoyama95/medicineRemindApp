//
//  ModalViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2022/01/09.
//

import UIKit
import RealmSwift

protocol DeleteCellDelegate {
    func deleteCell(indexPath: IndexPath)
}

class ModalViewController: UIViewController {
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var MedicineName: UILabel!
    
    var editingMedicineName = ""
    var deleteCellDelegate: DeleteCellDelegate?
    var indexPath: IndexPath?
    var item: TodoItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicineName.text = editingMedicineName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editAction(_ sender: Any) {
        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "editView") as! EditMedicineViewController
        editVC.indexPath = indexPath
        editVC.item = item
        self.present(editVC, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        deleteCellDelegate?.deleteCell(indexPath: indexPath!)
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
