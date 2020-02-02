//
//  kojin.swift
//  original
//
//  Created by Kimura Yuria on 2019/11/10.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit

class kojin: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var memoTableView:  UITableView!
    var memoArray = [String]()
    let ud = UserDefaults.standard
    
    //セルの数を決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memoArray.count
        }
    //セルを取得して表示させる
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "memocell", for: indexPath)
            cell.textLabel?.text = memoArray[indexPath.row]
            return cell
        }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "toDetail", sender: nil)
//        //押したら押した状態を解除
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    func loadMemo(){
        if ud.array(forKey: "memoArray") != nil{
            //取得またas！でアンラップしているのでnilじゃない時のみ
            memoArray = ud.array(forKey: "memoArray") as! [String]
            //reloadしてくれる
            memoTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //resurtarrayの中のindexpathのrow番目を消去する
            memoArray.remove(at: indexPath.row)
            
            //再びアプリ内に消去した配列を保存
            ud.set(memoArray, forKey: "memoArray")
            //tableviewを更新
            tableView.reloadData()
        }
    }
    
    @IBAction func SaveMemo() {
        let saveData: UserDefaults = UserDefaults.standard
        
        
        //UserDefaultsに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        
        let alert: UIAlertController = UIAlertController(title:"保存", message: "保存します", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: { action in
                    //ボタンが押された時の動作
                    print("OKボタンが押されました!")
            }
            )
        )
        present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Do any additional setup after loading the view.
    
    // テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
    //               table.dataSource = self
    
    // セルの数を設定
    //           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //                return 10
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
