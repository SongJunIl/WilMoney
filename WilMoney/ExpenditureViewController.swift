//
//  ExpenditureViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class ExpenditureViewController: UIViewController {

    /*고정 지출 아울렛*/
    @IBOutlet weak var expenditureNameField: UITextField!
    @IBOutlet weak var expenditureNameField1: UITextField!
    @IBOutlet weak var expenditureNameField2: UITextField!
    @IBOutlet weak var expenditureNameField3: UITextField!
    @IBOutlet weak var expenditureNameField4: UITextField!
    
    @IBOutlet weak var expenditurePriceField: UITextField!
    @IBOutlet weak var expenditurePriceField1: UITextField!
    @IBOutlet weak var expenditurePriceField2: UITextField!
    @IBOutlet weak var expenditurePriceField3: UITextField!
    @IBOutlet weak var expenditurePriceField4: UITextField!
    
    @IBOutlet weak var expenditureNameLabel: UILabel!
    @IBOutlet weak var expenditureNameLabel1: UILabel!
    @IBOutlet weak var expenditureNameLabel2: UILabel!
    @IBOutlet weak var expenditureNameLabel3: UILabel!
    @IBOutlet weak var expenditureNameLabel4: UILabel!
    
    @IBOutlet weak var expenditurePriceLabel: UILabel!
    @IBOutlet weak var expenditurePriceLabel1: UILabel!
    @IBOutlet weak var expenditurePriceLabel2: UILabel!
    @IBOutlet weak var expenditurePriceLabel3: UILabel!
    @IBOutlet weak var expenditurePriceLabel4: UILabel!
    
    /*유동 지출 아울렛*/
    @IBOutlet weak var floatingExpenditureNameField: UITextField!
    @IBOutlet weak var floatingExpenditureNameField1: UITextField!
    @IBOutlet weak var floatingExpenditureNameField2: UITextField!
    @IBOutlet weak var floatingExpenditureNameField3: UITextField!
    
    @IBOutlet weak var floatingExpenditurePriceField: UITextField!
    @IBOutlet weak var floatingExpenditurePriceField1: UITextField!
    @IBOutlet weak var floatingExpenditurePriceField2: UITextField!
    @IBOutlet weak var floatingExpenditurePriceField3: UITextField!
    
    @IBOutlet weak var floatingExpenditureNameLabel: UILabel!
    @IBOutlet weak var floatingExpenditureNameLabel1: UILabel!
    @IBOutlet weak var floatingExpenditureNameLabel2: UILabel!
    @IBOutlet weak var floatingExpenditureNameLabel3: UILabel!
    
    @IBOutlet weak var floatingExpenditurePriceLabel: UILabel!
    @IBOutlet weak var floatingExpenditurePriceLabel1: UILabel!
    @IBOutlet weak var floatingExpenditurePriceLabel2: UILabel!
    @IBOutlet weak var floatingExpenditurePriceLabel3: UILabel!
    
    var expenditureNameLabelArray = Array<UILabel>()
    var expenditurePriceLabelArray = Array<UILabel>()
    
    var expenditureNameFieldArray = Array<UITextField>()
    var expenditurePriceFieldArray = Array<UITextField>()
    
    var floatingExpenditureNameFieldArray = Array<UITextField>()
    var floatingExpenditurePriceFieldArray = Array<UITextField>()
    
    var floatingExpenditureNameLabelArray = Array<UILabel>()
    var floatingExpenditurePriceLabelArray = Array<UILabel>()
    
    var expenditureTotalLabelArray = Array<UIView>()
    var expenditureTotalFieldArray = Array<UIView>()
    
    var floatingExpendTotalLabelArray = Array<UIView>()
    var floatingExpendTotalFieldArray = Array<UIView>()
    override func viewDidLoad() {
        super.viewDidLoad()
       initArray()
    }
    
    func initArray() {
        expenditureTotalLabelArray = [self.expenditureNameLabel,self.expenditureNameLabel1,self.expenditureNameLabel2,self.expenditureNameLabel3,self.expenditureNameLabel4,self.expenditurePriceLabel,self.expenditurePriceLabel1,self.expenditurePriceLabel2,self.expenditurePriceLabel3,self.expenditurePriceLabel4]
        expenditureTotalFieldArray = [self.expenditureNameField,self.expenditureNameField1,self.expenditureNameField2,self.expenditureNameField3,self.expenditureNameField4,self.expenditurePriceField,self.expenditurePriceField1,self.expenditurePriceField2,self.expenditurePriceField3,self.expenditurePriceField4]
        
        floatingExpendTotalLabelArray = [self.floatingExpenditureNameLabel,self.floatingExpenditureNameLabel1,self.floatingExpenditureNameLabel2,self.floatingExpenditureNameLabel3,self.floatingExpenditurePriceLabel,self.floatingExpenditurePriceLabel1,self.floatingExpenditurePriceLabel2,self.floatingExpenditurePriceLabel3]
        floatingExpendTotalFieldArray = [self.floatingExpenditureNameField,self.floatingExpenditureNameField1,self.floatingExpenditureNameField2,self.floatingExpenditureNameField3,self.floatingExpenditurePriceField,self.floatingExpenditurePriceField1,self.floatingExpenditurePriceField2,self.floatingExpenditurePriceField3]
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if let monthSelectVC = self.storyboard?.instantiateViewController(withIdentifier: "MonthSelectViewController") {
            monthSelectVC.modalPresentationStyle = .fullScreen
            self.present(monthSelectVC, animated: true, completion: nil)
        }
    }
    
    /*고정 지출 스위치버튼 액션*/
    @IBAction func expenditureSwitchAction(_ sender: Any) {
        if let switchButton = sender as? UISwitch{
            if !switchButton.isOn {
                for textField in expenditureTotalFieldArray {
                    textField.isHidden = true
                }
                for label in expenditureTotalLabelArray {
                    label.isHidden = false
                }
               
            }else{
                for textField in expenditureTotalFieldArray {
                    textField.isHidden = false
                }
                for label in expenditureTotalLabelArray {
                    label.isHidden = true
                }
            
            }
        }
        
    }
    /*유동 지출 스위치버튼 액션*/
    @IBAction func floatingExpenditureSwitchAction(_ sender: Any) {
        if let switchButton = sender as? UISwitch{
            if !switchButton.isOn {
                for textField in floatingExpendTotalFieldArray {
                    textField.isHidden = true
                }
                for label in floatingExpendTotalLabelArray {
                    label.isHidden = false
                }
            }else{
                for textField in floatingExpendTotalFieldArray {
                    textField.isHidden = false
                }
                for label in floatingExpendTotalLabelArray {
                    label.isHidden = true
                }
            }
        }
    }
    
}
