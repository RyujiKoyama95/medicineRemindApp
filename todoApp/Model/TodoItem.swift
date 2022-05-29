//
//  TodoItem.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/22.
//

import Foundation
import RealmSwift

class TodoItem:Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    @objc dynamic var isTakenMedicine: Bool = false
    @objc dynamic var dateString: String!
}
