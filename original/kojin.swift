//
//  kojin.swift
//  original
//
//  Created by Kimura Yuria on 2019/11/10.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit

class kojin: UIViewController{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    @IBAction func SaveMemo(){
        
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
    present(alert, animated: true, completion: nil) }
    
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
}
