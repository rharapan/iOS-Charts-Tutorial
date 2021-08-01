//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Rohit Harapanhalli on 7/25/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var lineChartBox: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
        graphLineChart(dataArray: data)
    }
    
    func graphLineChart(dataArray: [Int]){
        lineChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 240
        
        lineChartBox.noDataText = "No data available."
        lineChartBox.noDataTextColor = UIColor.black
        
        var entries = [ChartDataEntry]()
        
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        lineChartBox.chartDescription?.text = "Pi Values"
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }


}

