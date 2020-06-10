//
//  MonthDetailViewController.swift
//  WilMoney
//
//  Created by 휴빌론 on 11/03/2020.
//  Copyright © 2020 JlCompany. All rights reserved.
//

import UIKit
import Charts
class MonthDetailViewController: UIViewController,ChartViewDelegate{

    @IBOutlet weak var extraMoneyLabel: UILabel!
    @IBOutlet weak var savingMoneyLabel: UILabel!
    @IBOutlet weak var monthlyAssetsLabel: UILabel!
    @IBOutlet weak var lineChartView: BarChartView!
    
    public var monthTag = 0
    var monthValue = 0
    var monthInfoDic = NSDictionary()
    var myAssetsInfoDic = NSDictionary()
    var monthDic:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (monthTag != 0 ) {
            self.navigationItem.title = "\(monthTag)월"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLayout()
        setChartsView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
    }
    
    func setChartsView() {
        var numbers: [Double] = []
        var months:[String] = []
        
        for i in 1...12 {
            if UserDefaults.standard.object(forKey: "\(i)월") != nil {
                if let dic = UserDefaults.standard.object(forKey: "\(i)월") as? NSDictionary {
                    if dic.count >= 4 {
                        if  dic.count != 0 {
                            let salaryMoney:Int = Int(dic["ma1"] as! String)! //급여
                            let addAssets:Int = Int(dic["ma3"] as! String)! //추가 자산
                            let monthExpenditure:Int = dic["totalExpenditure"] as! Int
                            let totalMoney:Int = Int(dic["ma2"] as! String)! //현재 자산
                            let value:Double = Double(addAssets + totalMoney + (salaryMoney - monthExpenditure))
                            monthDic.updateValue(value, forKey: "\(i)월")
                            
                            numbers.append(monthDic["\(i)월"] as! Double)
                            months.append("\(i)월")
                        }
                    }
                }
            }
        }
                
        
        var lineChartEntry = [ChartDataEntry]() // graph 에 보여줄 data array
        
        
        // chart data array 에 데이터 추가
        for i in 0..<numbers.count {
            let value = BarChartDataEntry(x: Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        lineChartView.delegate = self
        lineChartView.rightAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.legend.enabled = false
        lineChartView.setScaleEnabled(false)
        lineChartView.doubleTapToZoomEnabled = false
        
        
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        lineChartView.xAxis.granularity = 1
        lineChartView.xAxis.labelPosition = .bottom
        
        
        let line1 = BarChartDataSet(entries: lineChartEntry, label: "")
        let data = BarChartData()
        data.addDataSet(line1)
        
        lineChartView.data = data
        
        lineChartView.animate(xAxisDuration: 1.0, yAxisDuration: 2.0, easingOption: .linear)
    }
    
    func setLayout() {
        if UserDefaults.standard.object(forKey: "\(monthTag)월") != nil {
            if let dic = UserDefaults.standard.object(forKey: "\(monthTag)월") as? NSDictionary {
                monthInfoDic = dic
                print(monthInfoDic)
                
                if monthInfoDic.count >= 4 {
                    if  monthInfoDic.count != 0 {
                        let salaryMoney:Int = Int(monthInfoDic["ma1"] as! String)! //급여
                        let addAssets:Int = Int(monthInfoDic["ma3"] as! String)! //추가 자산
                        let monthExpenditure:Int = monthInfoDic["totalExpenditure"] as! Int
                        let totalMoney:Int = Int(monthInfoDic["ma2"] as! String)! //현재 자산
                        let numberFormatter = NumberFormatter()
                        numberFormatter.numberStyle = .decimal
                        monthValue =  addAssets + totalMoney + (salaryMoney - monthExpenditure)
                        extraMoneyLabel.text = numberFormatter.string(for:NSNumber(value:salaryMoney - monthExpenditure))
                        savingMoneyLabel.text = "(예상금액) " + extraMoneyLabel.text!
                        monthlyAssetsLabel.text = numberFormatter.string(for:NSNumber(value:addAssets + totalMoney + (salaryMoney - monthExpenditure)))
                    }else{
                        extraMoneyLabel.text = "정보 미입력"
                        savingMoneyLabel.text = "정보 미입력"
                        monthlyAssetsLabel.text = "정보 미입력"
                    }
                } else {
                    let alert = UIAlertController(title: "알림", message: "내 자산을 및 지출 내역을 등록해주세요.", preferredStyle: UIAlertController.Style.alert)
                    let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }
                    alert.addAction(defaultAction)
                    present(alert, animated: false, completion: nil)
                    
                }
                
            }
        } else {
            let alert = UIAlertController(title: "알림", message: "내 자산을 및 지출 내역을 등록해주세요.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "확인", style: .cancel) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
            
        }
        
    }

    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mv = storyboard.instantiateViewController(withIdentifier: "HoldingAssetsDetailViewController") as! HoldingAssetsDetailViewController
        
        if let value = chartView.data?.entryForHighlight(highlight)?.y {
            switch value {
            case (monthDic["1월"] as? Double):
                mv.selectMonth = "1월"
                mv.totalMoney = (monthDic["1월"] as? Double)!
                
            case (monthDic["2월"] as? Double):
                mv.selectMonth = "2월"
                mv.totalMoney = (monthDic["2월"] as? Double)!
                
            case monthDic["3월"] as? Double:
                mv.selectMonth = "3월"
                mv.totalMoney = (monthDic["3월"] as? Double)!
                
            case monthDic["4월"] as? Double:
                mv.selectMonth = "4월"
                mv.totalMoney = (monthDic["4월"] as? Double)!
                
            case monthDic["5월"] as? Double:
                mv.selectMonth = "5월"
                mv.totalMoney = (monthDic["5월"] as? Double)!
                
            case monthDic["6월"] as? Double:
                mv.selectMonth = "6월"
                mv.totalMoney = (monthDic["6월"] as? Double)!
                
            case monthDic["7월"] as? Double:
                mv.selectMonth = "7월"
                mv.totalMoney = (monthDic["7월"] as? Double)!
                
            case monthDic["8월"] as? Double:
                mv.selectMonth = "8월"
                mv.totalMoney = (monthDic["8월"] as? Double)!
                
            case monthDic["9월"] as? Double:
                mv.selectMonth = "9월"
                mv.totalMoney = (monthDic["9월"] as? Double)!
                
            case monthDic["10월"] as? Double:
                mv.selectMonth = "10월"
                mv.totalMoney = (monthDic["10월"] as? Double)!
                
            case monthDic["11월"] as? Double:
                mv.selectMonth = "11월"
                mv.totalMoney = (monthDic["11월"] as? Double)!
                
            case monthDic["12월"] as? Double:
                mv.selectMonth = "12월"
                mv.totalMoney = (monthDic["12월"] as? Double)!
                
            default:
                break
            }
        }
        self.present(mv, animated: true, completion: nil)
    }
}
