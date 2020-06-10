//
//  5000 MyAssetsViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class MyAssetsViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var presentlyAssetsTextField: UITextField!
    @IBOutlet weak var addAssetsTextField: UITextField!
    
    var totalFieldArray = Array<UITextField>()
    var monthInfoDic = NSMutableDictionary()
    var walletDic = NSMutableDictionary()
    var month = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalFieldArray = [self.salaryTextField,self.presentlyAssetsTextField,self.addAssetsTextField];
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        totalFieldArray = [self.salaryTextField,self.presentlyAssetsTextField,self.addAssetsTextField];
        
        for textField in totalFieldArray {
            textField.delegate = self
        }
        
        var selMonth = ""
        if let dic = UserDefaults.standard.string(forKey: "selectMonth") {
             selMonth = dic
         }
        
        if selMonth == "0" || selMonth == "" {
            let alert = UIAlertController(title: "알림", message: "월별 지출내역을 먼저 등록해 주세요.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in
               self.tabBarController?.selectedIndex = 1
            }
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
        } else {
            let alert = UIAlertController(title: "알림", message: "선택한 달은 \(selMonth)월 입니다.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in}
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
        }
        
        if let dic = UserDefaults.standard.object(forKey: "MyWallet") as? NSDictionary {
            if dic.count >= 3 {
                self.salaryTextField.text = (dic["ma1"] as! String)
                self.presentlyAssetsTextField.text = (dic["ma2"] as! String)
                self.addAssetsTextField.text = (dic["ma3"] as! String)
            }
        }
    }
    
    @IBAction func confimButtonAciton(_ sender: Any) {
        month = 0
        if UserDefaults.standard.string(forKey: "selectMonth") != nil {
            month = Int(UserDefaults.standard.string(forKey: "selectMonth")!)!
            if let dic = UserDefaults.standard.object(forKey: "\(month)월") as? NSDictionary {
                monthInfoDic = NSMutableDictionary(dictionary: dic)
            }
        }
        
        if let dic = UserDefaults.standard.object(forKey: "MyWallet") as? NSDictionary {
            walletDic = NSMutableDictionary(dictionary: dic)
        }
        
    
        if self.salaryTextField.text! != ""{
            monthInfoDic.setValue(self.salaryTextField.text!, forKey:"ma1")
        }
        if self.presentlyAssetsTextField.text! != ""{
            monthInfoDic.setValue(self.presentlyAssetsTextField.text!, forKey:"ma2")
        }
        if self.addAssetsTextField.text! != ""{
            monthInfoDic.setValue(self.addAssetsTextField.text!, forKey:"ma3")
        }
        
        if monthInfoDic.count >= 3 {
            let alert = UIAlertController(title: "알림", message: "적용 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in}
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
            UserDefaults.standard.set(monthInfoDic as NSDictionary, forKey:"\(month)월")
            UserDefaults.standard.set(walletDic as NSDictionary, forKey:"MyWallet")
            
            UserDefaults.standard.synchronize()
        }else{
            let alert = UIAlertController(title: "알림", message: "자산을 모두 채워주세요", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in}
            alert.addAction(defaultAction)
            monthInfoDic = NSMutableDictionary()
            present(alert, animated: false, completion:nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
