//
//  MonthDetailViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class MonthDetailViewController: UIViewController {

    public var monthTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (monthTag != 0 ) {
            self.navigationItem.title = "\(monthTag)월"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
