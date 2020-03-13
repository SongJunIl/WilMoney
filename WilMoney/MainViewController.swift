//
//  MainViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var commonBottomTapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func monthButtonAction(_ sender: Any) {
       if let button = sender as? UIButton {
        let monthVC = self.storyboard?.instantiateViewController(withIdentifier:"MonthDetailViewController") as! MonthDetailViewController
        monthVC.monthTag = button.tag
        self.navigationController?.pushViewController(monthVC, animated: true)
        }
    }


}
