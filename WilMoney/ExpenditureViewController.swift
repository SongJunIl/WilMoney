//
//  ExpenditureViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit

class ExpenditureViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var wonLabel2: UILabel!
    @IBOutlet weak var wonLabel3: UILabel!
    @IBOutlet weak var wonLabel4: UILabel!
    @IBOutlet weak var wonLabel5: UILabel!
    @IBOutlet weak var wonLabel6: UILabel!
    @IBOutlet weak var wonLabel7: UILabel!
    @IBOutlet weak var wonLabel8: UILabel!
    @IBOutlet weak var wonLabel9: UILabel!
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
    
    var expenditureTotalLabelArray = Array<UILabel>()
    var expenditureTotalFieldArray = Array<UITextField>()
    
    var floatingExpendTotalLabelArray = Array<UILabel>()
    var floatingExpendTotalFieldArray = Array<UITextField>()
    
    var wonLabelTotalArray = Array<UILabel>()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initArray()
        
         for textField in expenditureTotalFieldArray {
             textField.delegate = self
         }
         for textField in floatingExpendTotalFieldArray {
             textField.delegate = self
         }
    }
    
    func initArray() {
        expenditureTotalLabelArray = [self.expenditureNameLabel,self.expenditureNameLabel1,self.expenditureNameLabel2,self.expenditureNameLabel3,self.expenditureNameLabel4,self.expenditurePriceLabel,self.expenditurePriceLabel1,self.expenditurePriceLabel2,self.expenditurePriceLabel3,self.expenditurePriceLabel4]
        expenditureTotalFieldArray = [self.expenditureNameField,self.expenditureNameField1,self.expenditureNameField2,self.expenditureNameField3,self.expenditureNameField4,self.expenditurePriceField,self.expenditurePriceField1,self.expenditurePriceField2,self.expenditurePriceField3,self.expenditurePriceField4]
        
        floatingExpendTotalLabelArray = [self.floatingExpenditureNameLabel,self.floatingExpenditureNameLabel1,self.floatingExpenditureNameLabel2,self.floatingExpenditureNameLabel3,self.floatingExpenditurePriceLabel,self.floatingExpenditurePriceLabel1,self.floatingExpenditurePriceLabel2,self.floatingExpenditurePriceLabel3]
        floatingExpendTotalFieldArray = [self.floatingExpenditureNameField,self.floatingExpenditureNameField1,self.floatingExpenditureNameField2,self.floatingExpenditureNameField3,self.floatingExpenditurePriceField,self.floatingExpenditurePriceField1,self.floatingExpenditurePriceField2,self.floatingExpenditurePriceField3]
        
        wonLabelTotalArray = [self.wonLabel,self.wonLabel2,self.wonLabel3,self.wonLabel4,self.wonLabel5,self.wonLabel6,self.wonLabel7,self.wonLabel8,self.wonLabel9]
    }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
                    textField.delegate = self
                    textField.isHidden = true
                }
                for label in expenditureTotalLabelArray {
                    label.isHidden = false
                }
                
                if !self.expenditureNameField.text!.isEmpty {
                    self.expenditureNameLabel.text = self.expenditureNameField.text
                }else{
                    self.wonLabel.isHidden = true
                }
                if !self.expenditureNameField1.text!.isEmpty {
                    self.expenditureNameLabel1.text = self.expenditureNameField1.text
                }else{
                    self.wonLabel2.isHidden = true
                }
                if !self.expenditureNameField2.text!.isEmpty {
                   self.expenditureNameLabel2.text = self.expenditureNameField2.text
                }else{
                    self.wonLabel3.isHidden = true
                }
                if !self.expenditureNameField3.text!.isEmpty {
                    self.expenditureNameLabel3.text = self.expenditureNameField3.text
                }else{
                    self.wonLabel4.isHidden = true
                }
                if !self.expenditureNameField4.text!.isEmpty {
                    self.expenditureNameLabel4.text = self.expenditureNameField4.text
                }else{
                    self.wonLabel5.isHidden = true
                }
                
            }else{
                for textField in expenditureTotalFieldArray {
                    textField.delegate = self
                    textField.isHidden = false
                }
                for label in expenditureTotalLabelArray {
                    label.isHidden = true
                }
                for wonLabel in wonLabelTotalArray {
                    wonLabel.isHidden = false
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
                if !self.floatingExpenditureNameField.text!.isEmpty {
                    self.floatingExpenditureNameLabel.text = self.floatingExpenditureNameField.text
                }else{
                    self.wonLabel6.isHidden = true
                }
                if !self.floatingExpenditureNameField1.text!.isEmpty {
                    self.floatingExpenditureNameLabel1.text = self.floatingExpenditureNameField1.text
                }else{
                    self.wonLabel7.isHidden = true
                }
                if !self.floatingExpenditureNameField2.text!.isEmpty {
                    self.floatingExpenditureNameLabel2.text = self.floatingExpenditureNameField2.text
                }else{
                    self.wonLabel8.isHidden = true
                }
                if !self.floatingExpenditureNameField3.text!.isEmpty {
                    self.floatingExpenditureNameLabel3.text = self.floatingExpenditureNameField3.text
                }else{
                    self.wonLabel9.isHidden = true
                }

            }else{
                for textField in floatingExpendTotalFieldArray {
                    textField.isHidden = false
                }
                for label in floatingExpendTotalLabelArray {
                    label.isHidden = true
                }
                for wonLabel in wonLabelTotalArray {
                    wonLabel.isHidden = false
                }
            }
        }
    }
    
}
