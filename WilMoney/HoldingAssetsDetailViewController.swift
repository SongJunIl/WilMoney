//
//  HoldingAssetsDetailViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 04/06/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit
import Charts
class HoldingAssetsDetailViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    
    public var totalMoney: Double = 0.0
    public var selectMonth = ""
    var salaryMoney:Double = 0.0
    var addAssets:Double = 0.0
    var monthExpenditure:Double = 0.0
    var WalletMoney:Double = 0.0
    var extraMoney: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if UserDefaults.standard.object(forKey: selectMonth) != nil {
                if let dic = UserDefaults.standard.object(forKey: selectMonth) as? NSDictionary {
                    if dic.count >= 4 {
                        if  dic.count != 0 {
                            addAssets = Double(dic["ma3"] as! String)! //추가 자산
                            WalletMoney = Double(dic["ma2"] as! String)! //현재 자산
                            salaryMoney = Double(dic["ma1"] as! String)! //급여
                            monthExpenditure = Double(dic["totalExpenditure"] as! Int)
                            extraMoney = salaryMoney - monthExpenditure
                            
                        }
                    }
                }
            }
        
        let months = ["주식", "은행","저축금액(예상)"]
        let unitsSold = [addAssets, WalletMoney,extraMoney]
        setChart(dataPoints: months, values: unitsSold)
        
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
//        var dataEntries: [ChartDataEntry] = []
        
        var entries = [PieChartDataEntry]()
        for (index, value) in values.enumerated() {
               let entry = PieChartDataEntry()
               entry.y = value
               entry.label = dataPoints[index]
               entries.append(entry)
           }
        
        let pieChartDataSet = PieChartDataSet(entries: entries, label: "항목")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
