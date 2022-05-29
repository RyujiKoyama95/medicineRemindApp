//
//  JudgeViewController.swift
//  todoApp
//
//  Created by 小山竜二 on 2021/11/25.
//

import UIKit

class JudgeViewController: UIViewController {
    @IBOutlet weak var itemField: UILabel!
    @IBOutlet weak var numberOfDaysButton1: UIButton!
    @IBOutlet weak var numberOfDaysButton2: UIButton!
    @IBOutlet weak var numberOfDaysButton3: UIButton!
    @IBOutlet weak var numberOfDaysButton4: UIButton!
    
    var selectedMedicine = ""
    var answer = 0
    var date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemField.text = self.selectedMedicine
        setButtonTitle()
        
        // Do any additional setup after loading the view.
    }
    
    func setButtonAnswer(date: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEE", options: 0, locale: .current)
        let date = formatter.string(from: Date())
        
        switch(date) {
        case "Sun":
            return 0
        case "Sat":
            return 1
        case "Fri":
            return 2
        case "Thu":
            return 3
        case "Wed":
            return 4
        case "Tue":
            return 5
        case "Mon":
            return 6
        default:
            return 0
        }
    }
    
    func setButtonTitle() {
        var answerList = [setButtonAnswer(date: date)]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...6)
            if !answerList.contains(randomAnswer) {
                answerList.append(randomAnswer)
            }
        }
        answerList.shuffle()
        numberOfDaysButton1.setTitle("\(answerList[0])日分", for: .normal)
        numberOfDaysButton2.setTitle("\(answerList[1])日分", for: .normal)
        numberOfDaysButton3.setTitle("\(answerList[2])日分", for: .normal)
        numberOfDaysButton4.setTitle("\(answerList[3])日分", for: .normal)
    }
    
    @IBAction func btnAction1(_ sender: Any) {
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        if numberOfDaysButton1.currentTitle == "0日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
            resultVC.lastResultText = "1週間分の薬を補充してください！"
        } else if numberOfDaysButton1.currentTitle == "\(setButtonAnswer(date: date))日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
        } else {
            resultVC.resultIcon = "😩"
            resultVC.resultText = "数が合っていません。。"
        }
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func btnAction2(_ sender: Any) {
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        if numberOfDaysButton2.currentTitle == "0日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
            resultVC.lastResultText = "1週間分の薬を補充してください！"
        } else if numberOfDaysButton2.currentTitle == "\(setButtonAnswer(date: date))日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
        } else {
            resultVC.resultIcon = "😩"
            resultVC.resultText = "数が合っていません。。"
        }
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func btnAction3(_ sender: Any) {
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        if numberOfDaysButton3.currentTitle == "0日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
            resultVC.lastResultText = "1週間分の薬を補充してください！"
        } else if numberOfDaysButton3.currentTitle == "\(setButtonAnswer(date: date))日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
        } else {
            resultVC.resultIcon = "😩"
            resultVC.resultText = "数が合っていません。。"
        }
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func btnAction4(_ sender: Any) {
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        if numberOfDaysButton3.currentTitle == "0日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
            resultVC.lastResultText = "1週間分の薬を補充してください！"
        } else if numberOfDaysButton3.currentTitle == "\(setButtonAnswer(date: date))日分" {
            resultVC.resultIcon = "👍"
            resultVC.resultText = "完璧です！！"
        } else {
            resultVC.resultIcon = "😩"
            resultVC.resultText = "数が合っていません。。"
        }
        present(resultVC, animated: true, completion: nil)
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
