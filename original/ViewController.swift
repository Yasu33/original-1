//
//  ViewController.swift
//  original
//
//  Created by Kimura Yuria on 2019/11/10.
//  Copyright © 2019 Kimura Yuria. All rights reserved.
//

import UIKit
import FSCalendar



class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance  {
    
    
    
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var schedulelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        
    }

//IDtukino
    
    func calendar(_ calender: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component (.year, from: date)
        let month = tmpDate.component (.month, from: date)
        let day = tmpDate.component (.day, from: date)
        labelDate.text = "\(year)/\(month)/\(day)"
        
        
    }
    
}

