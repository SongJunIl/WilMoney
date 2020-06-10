//
//  MonthSelectViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 12/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class MonthSelectViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var monthPickerView: UIPickerView!
    
    private let monthArray: [String] = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
    public var totalMoney = Int()
    public var floatingExpendDic = NSMutableDictionary()
    var monthInt = 1
    var monthInfoDic = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        monthPickerView.delegate = self
        monthPickerView.dataSource = self
    }
    
    @IBAction func monthSelectButtonAction(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "\(monthInt)월") != nil {
            if let dic = UserDefaults.standard.object(forKey: "\(monthInt)월") as? NSDictionary {
                monthInfoDic = dic.mutableCopy() as! NSMutableDictionary
                print(monthInfoDic)
            }
        }
        monthInfoDic.setValue(totalMoney, forKey: "totalExpenditure")
        monthInfoDic.setValue(monthInt, forKey: "month")
        UserDefaults.standard.set(monthInfoDic as NSDictionary, forKey: "\(monthInt)월")
        UserDefaults.standard.set("\(monthInt)", forKey: "selectMonth")
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return monthArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monthArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        monthInt = row+1
    }
}
