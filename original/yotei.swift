//
//  yotei.swift
//  original
//
//  Created by Kimura Yuria on 2019/12/22.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit

class yotei: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
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

}
