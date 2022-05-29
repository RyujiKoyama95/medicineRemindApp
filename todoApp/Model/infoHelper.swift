//
//  infoHelper.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/23.
//

import Foundation
import RealmSwift
import NotificationCenter

class infoHelper {
    
    let realm = try! Realm()
    
    func save(name: String, date: Date, isTaken: Bool) {
        let item = TodoItem()
        item.name = name
        item.date = date
        item.id = String(Int.random(in: 0...9999))
        item.isTakenMedicine = isTaken
        item.dateString = dateToDateString(date: date)
        try! realm.write {
            realm.add(item)
        }
        setNotification(item: item)
    }
    
    func dateToTimeString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func dateToDateString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y/M/d"
        return formatter.string(from: date)
    }
    
    func setNotification(item: TodoItem) {
        let targetDate = Calendar.current.dateComponents([.hour, .minute], from: item.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetDate, repeats: true)
        let content = UNMutableNotificationContent()
        content.title = "服用する時間です！"
        content.body = "\(item.name)を服用してボタンをタップしてください！"
        content.sound = .default
        //通知の内容や、配送のトリガーを内包する
        let request = UNNotificationRequest(identifier: item.id, content: content, trigger: trigger)
        //通知関連の機能を管理する
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func deleteItem(item: TodoItem, token: NotificationToken) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.id])
        try! realm.write(withoutNotifying: [token]) {
            realm.delete(item)
        }
    }
    
    
}
