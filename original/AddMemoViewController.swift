//
//  AddMemoViewController.swift
//  original
//
//  Created by Kimura Yuria on 2020/01/19.
//  Copyright © 2020 Kimura Yuria. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveMemo() {
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            //saveMemoArrayに取得
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            //テキストに何か書かれているか
            if inputText != ""{
            
            //配列に追か
                saveMemoArray.append(inputText!)
                ud.set(saveMemoArray, forKey: "memoArray")
            }else{
                let alert: UIAlertController = UIAlertController(title: "エラー", message: "何も追加されていません", preferredStyle: .alert)
                present(alert, animated: true,completion: nil)
            }
        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String] ()
            //nilを強制アンラップはエラーが出るから
            if inputText != ""{
                //inputtextはoptionalはoptional型だから強制アンラップ
                newMemoArray.append(inputText!)
                ud.set(newMemoArray, forKey: "memoArray")
            }else{
                let alert: UIAlertController = UIAlertController(title: "エラー", message: "何も追加されていません", preferredStyle: .alert)
                present(alert, animated: true,completion: nil)
            }
            }
        let alert: UIAlertController = UIAlertController(title: "保存完了", message: "", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: {action in
                                       //ボタンが押された時の動作
                                        print("OKボタンが押されました!")
            }
                )
            )
        
        present(alert, animated: true,completion: nil)
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
      
    }
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

