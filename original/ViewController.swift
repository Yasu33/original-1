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
    
    
    
    
    @IBOutlet var calendar: FSCalendar!
//    @IBOutlet var labelDate: UILabel!
    //@IBOutlet var schedulelabel: UILabel!
    
    var year: Int!
    var month: Int!
    var day: Int!
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
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
    
    func calendar(_ calender: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let tmpDate = Calendar(identifier: .gregorian)
        year = tmpDate.component (.year, from: date)
        month = tmpDate.component (.month, from: date)
        day = tmpDate.component (.day, from: date)
//        labelDate.text = "\(String(describing: year))/\(String(describing: month))/\(String(describing: day))"
        
        self.performSegue(withIdentifier: "toSecond", sender: nil)
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
        
    }
    
}

