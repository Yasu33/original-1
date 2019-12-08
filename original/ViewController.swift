//
//  ViewController.swift
//  original
//
//  Created by Kimura Yuria on 2019/11/10.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    //storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
    }
//セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
//IDtukino
}

