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
//        let name = String(describing: CommonBottomTapView.self)
//        guard let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil) else { return }
//        guard let commonTapView = loadedNib.first as? CommonBottomTapView else { return }
//        commonBottomTapView.addSubview(commonTapView)
    }
    
    @IBAction func monthButtonAction(_ sender: Any) {
       if let button = sender as? UIButton {
        let monthVC = self.storyboard?.instantiateViewController(withIdentifier:"MonthDetailViewController") as! MonthDetailViewController
        monthVC.monthTag = button.tag
        self.navigationController?.pushViewController(monthVC, animated: true)
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

}
