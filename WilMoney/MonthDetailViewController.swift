//
//  MonthDetailViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class MonthDetailViewController: UIViewController {

    @IBOutlet weak var extraMoneyLabel: UILabel!
    @IBOutlet weak var savingMoneyLabel: UILabel!
    @IBOutlet weak var monthlyAssetsLabel: UILabel!
    
    public var monthTag = 0
    
    var monthInfoDic = NSDictionary()
    var myAssetsInfoDic = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        if (monthTag != 0 ) {
            self.navigationItem.title = "\(monthTag)월"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "\(monthTag)월") != nil {
            if let dic = UserDefaults.standard.object(forKey: "\(monthTag)월") as? NSDictionary {
                monthInfoDic = dic
                print(monthInfoDic)
            }
        }
        
    
        if  monthInfoDic.count != 0 {
            let currentAssets:Int = Int(monthInfoDic["ma1"] as! String)!
            let addAssets:Int = Int(monthInfoDic["ma3"] as! String)!
            let monthExpenditure:Int = monthInfoDic["totalExpenditure"] as! Int
            let totalMoney:Int = Int(monthInfoDic["ma2"] as! String)!
            
            extraMoneyLabel.text = "\((currentAssets+addAssets) - monthExpenditure)"
            savingMoneyLabel.text = extraMoneyLabel.text
            monthlyAssetsLabel.text = "\(totalMoney - monthExpenditure)"
            
        }else{
            extraMoneyLabel.text = "정보 미입력"
            savingMoneyLabel.text = "정보 미입력"
            monthlyAssetsLabel.text = "정보 미입력"
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
