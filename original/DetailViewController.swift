//
//  DetailViewController.swift
//  original
//
//  Created by Kimura Yuria on 2020/02/06.
//  Copyright © 2020 Kimura Yuria. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var memoTextView: UITextView!
    
    var selectedRow: Int!
    var selectedMemo: String!

    override func viewDidLoad() {
        super.viewDidLoad()
       memoTextView.text = selectedMemo
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func deleteMemo(_ sender: Any){
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            ud.synchronize()
            
           
            //画面遷移
            self.navigationController?.popViewController(animated: true)
        
            let alert: UIAlertController = UIAlertController(title: "削除されました", message: "", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(title: "OK", style: .default, handler: {action in
                    //ボタンが押された時の動作
                    print("削除ボタンが押されました!")
                    self.navigationController?.popViewController(animated: true)
                    
                    
    }
        )
            )
            present(alert, animated: true,completion: nil)
    }
    }

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
