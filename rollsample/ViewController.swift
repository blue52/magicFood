//
//  ViewController.swift
//  rollsample
//
//  Created by sky on 2016/8/16.
//  Copyright © 2016年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dataArray = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var wordsArray = [String]()
    var wordsArray2 = [String]()
    var wordsArray3 = [String]()
    
    
    @IBOutlet weak var resultLabel: UILabel!
        
    @IBAction func buttomClicked(_ sender: AnyObject) {
        
        
        pickerView.selectRow((Int)(arc4random()%94+3), inComponent: 0, animated: true)
        pickerView.selectRow((Int)(arc4random()%94+3), inComponent: 1, animated: true)
        pickerView.selectRow((Int)(arc4random()%94+3), inComponent: 2, animated: true)
        
       
        
        resultLabel.text = "魔法餐: \(self.stringFromChoosedComponents())"
    }
    //新增一個字串轉int的func
    func stringFromChoosedComponents() -> String {
        let index0 = pickerView.selectedRow(inComponent: 0)
        let index1 = pickerView.selectedRow(inComponent: 1)
        let index2 = pickerView.selectedRow(inComponent: 2)
        let result = "\(wordsArray[(Int)(dataArray[index0])]) \(wordsArray2[(Int)(dataArray2[index1])]) \(wordsArray3[(Int)(dataArray3[index2])])"
       
        return result
        
    }
    
    /*func stringFromChoosedComponents2() -> String {
        let index0 = pickerView.selectedRowInComponent(1)
        
        let string = wordsArray2[(Int)(dataArray[index0])]
        
        return string
    }*/
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wordsArray = ["奇異果","香蕉","蘋果","芭樂","火龍果","木瓜"]
        wordsArray2 = ["牛排","火鍋","炒飯","豬排飯","咖哩雞麵","肉骨茶麵"]
        wordsArray3 = ["豆漿","奶茶","烏龍綠茶","檸檬紅茶","芒果汁","冰拿鐵"]
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //設迴圈跑0~99，所以每一個component內有100筆資料，裡面存在著亂數0~5之間(因為設%6)
        
        for _ in 1...100 {
            
            dataArray.append((Int)(arc4random()%6))
            dataArray2.append((Int)(arc4random()%6))
            dataArray3.append((Int)(arc4random()%6))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var attributed = NSAttributedString()
        switch component {
        case 0:
            attributed = NSAttributedString(string: wordsArray[row], attributes: [NSForegroundColorAttributeName: UIColor.cyan])
        case 1:
            attributed = NSAttributedString(string: wordsArray2[row], attributes: [NSForegroundColorAttributeName: UIColor.white])
        case 2:
            attributed = NSAttributedString(string: wordsArray3[row], attributes: [NSForegroundColorAttributeName: UIColor.white])
        default:
            break
        }
        
        
        return attributed
        
    }
    
    
    //viewForRow功能，決定每個列上面要顯示什麼東西
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0{
            pickerLabel.text = wordsArray[(Int)(dataArray[row])]
            
        }else if component == 1 {
            pickerLabel.text = wordsArray2[(Int)(dataArray2[row])]
        }else{
            pickerLabel.text = wordsArray3[(Int)(dataArray3[row])]
        }
       //pickerLabel.font = UIFont(name: "細明體", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
        // returns the # of rows in each component(每一個component中需要準備幾個列row)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        /*if component == 0 {
            return dataArray.count
        }else if component == 1 {
            return dataArray2.count
        }else {
            return self.dataArray3.count
        }
        //這個func就是請它去問dataAarry內有幾筆資料
        */
        return 100 //設100是為了要有拉霸機的效果(一直轉的效果)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 80
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }

}

