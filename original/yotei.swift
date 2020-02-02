//
//  yotei.swift
//  original
//
//  Created by Kimura Yuria on 2019/12/22.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit
import Firebase

class yotei: UIViewController {
    
    struct Message{
        var senderId: String
        var name: String
        var message: String
        
    }
    @IBOutlet var chatTableVew: UITableView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var textview: UITextView!
   var db = Firestore.firestore()
       @IBOutlet var label: UILabel!
    
//    var ref: DocumentReference? = nil
//    ref = db.collection("users").addDocument(data: [
//        "Date" : Date()
//        "text" :
//        "sender_id": id,
//    ]) {err in
//    DispatchQueue.main.async{
//    if let err = err{
//        print("Errorwriting document: \(err)")
//    }else{
//        self.messageTextField.text == ""
//    }
//    }
//    }
    
    @IBAction func savetext(){
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "Date": "\(year!)/\(month!)/\(day!)",
            "text": textview.text!
//            "sender_id": id,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

    //ここで受け取る
//    var sendText:String = ""
    var year: Int!
    var month: Int!
    var day: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(year!,month!,day!)
        label.text = "\(year!)/\(month!)/\(day!)"
    }


        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        @IBAction func back() {
            self.dismiss(animated: true, completion: nil)
    }
}
