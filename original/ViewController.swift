//
//  ViewController.swift
//  original
//
//  Created by Kimura Yuria on 2019/11/10.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit
import FSCalendar
import Firebase


class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance  {
    var Calendertapcount = 0  // ボタンをタップした回数をカウント
    var countResetTimer: Timer!  // ボタンタップから次のボタンタップまでの時間を測る

   
    
    
    
    @IBOutlet var calendar: FSCalendar!
//    @IBOutlet var labelDate: UILabel!
    //@IBOutlet var schedulelabel: UILabel!
    
    var year: Int!
    var month: Int!
    var day: Int!
    var db = Firestore.firestore()
    
    var firstday: Calendar!
    
    @IBOutlet var mokuhyoutextfield: UITextField!
    let saveData: UserDefaults = UserDefaults.standard
    
    
    @IBAction func saveMemo(){
        saveData.set(mokuhyoutextfield.text, forKey: "mokuhyou")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mokuhyoutextfield.text = saveData.object(forKey: "mokuhyou") as? String
       
        // Do any additional setup after loading the view.
//        db.collection("users").whereField("Date", isEqualTo: "2020/2/24").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        self.dismiss(animated: true, completion: nil)
        }
   
    
//    @IBOutlet weak var textField: UITextField!
    
    //このメソッドで渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "toSecond" {
            
           
            
            let yotei:yotei = segue.destination as! yotei
            yotei.year = self.year!
            yotei.month = self.month!
            yotei.day = self.day!
        }
    }
    
   // @IBAction func SaveMemo(){
    
    //let alert: UIAlertController = UIAlertController(title:"保存", message: "保存します", preferredStyle: .alert)
        //present(alert, animated: true, completion: nil) }
    

//IDtukino
    
    //日付を押した時に呼ばれるメソッド
    func calendar(_ calender: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(Calendertapcount)
        let tmpDate = Calendar(identifier: .gregorian)
        //firstdayの型を調べる
        print(type(of: tmpDate))
        
        year = tmpDate.component (.year, from: date)
        month = tmpDate.component (.month, from: date)
        day = tmpDate.component (.day, from: date)
        
        firstday = tmpDate
        if tmpDate == firstday && Calendertapcount == 1{
            Calendertapcount = 2
        }else{
            Calendertapcount = 1
        }
        
//        @IBAction func tapCalenderButton(_sender :Any){
        
        if Calendertapcount == 2{
        }else{
        
            
       
            
//            if segue.identifier == "toSecond" {
            
            self.performSegue(withIdentifier: "toSecond", sender: nil)
        
            
                
//                let yotei:yotei = segue.destination as! yotei
//                yotei.year = self.year!
//                yotei.month = self.month!
//                yotei.day = self.day!
        }
//        }
        // ボタンを押した後にタップとタップに1秒以上空いた際にタップカウントをリセットする
        countResetTimer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(self.clear),
            userInfo: nil,
            repeats: false)
        
//        Calendertapcount += 1 //ボタンを押すとカウントをあげる
        
//        func countReset() {
//            Calendertapcount = 0
//        }
        
        
//        labelDate.text = "\(String(describing: year))/\(String(describing: month))/\(String(describing: day))"
        
//        var counter = 0
        
//        @IBAction func move1(_ sender: Any) {
//            counter = counter + 1
//            print(counter)
//
//            if counter == 2{
//                self.performSegue(withIdentifier: "toSecond", sender: nil)
//                counter = 0
//            }
//        }
        
//    }
    }

    @objc func clear() {
        Calendertapcount = 0
    }
   
}
