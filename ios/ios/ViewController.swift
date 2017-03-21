//
//  ViewController.swift
//  ios
//
//  Created by  上海海洋大学 on 2017/3/12.
//  Copyright © 2017年  上海海洋大学. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loanAmount: UITextField!
    @IBOutlet weak var loanTerm: UITextField!
    @IBOutlet weak var interestRate: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    
    @IBAction func simpleButton(_ sender: Any) {
        let caluculate1 = simpleCalculate()
        guard let loanTerm = loanTerm.text,let loanAmount = loanAmount.text,let interestRate = interestRate.text
            else{
                print("用户没有输入全部信息")
                return
        }
        
        guard let loanterm = Int(loanTerm),let loanamount = Double(loanAmount),let interestrate = Double(interestRate)
            else {
                print("用户输入数据格式有错")
                return
            
        }
        result.text=caluculate1.calculate(loanAmount:loanamount, loanTerm: loanterm, interestRate: interestrate).money
    }
    
    
    @IBAction func compoundButton(_ sender: Any) {
        let caluculate2 = compoundCaluculate()
        guard let loanTerm = loanTerm.text,let loanAmount = loanAmount.text,let interestRate = interestRate.text
            else{
                print("用户没有输入全部信息")
                return
        }
        
        guard let loanterm = Int(loanTerm),let loanamount = Double(loanAmount),let interestrate = Double(interestRate)
            else {
                print("用户输入数据格式有错")
                return
                
        }
        result.text=caluculate2.calculate(loanAmount:loanamount, loanTerm: loanterm, interestRate: interestrate).money
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        loanAmount.resignFirstResponder()
        loanTerm.resignFirstResponder()
        interestRate.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



class simpleCalculate{
        func calculate(loanAmount:Double,loanTerm:Int,interestRate:Double) -> Double{
        let rate = interestRate/100
        let interest = loanAmount * rate * Double(loanTerm)
        return loanAmount + interest
        }
    }
class compoundCaluculate{
        func calculate(loanAmount:Double,loanTerm:Int,interestRate:Double) -> Double{
        let rate = interestRate/100
        let compoundinterest = pow(1.0+rate, Double(loanTerm))
        return loanAmount * compoundinterest
        }
    }



extension Double{
    var money:String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let result:String?
        result = formatter.string(from: NSNumber(value:self))
        if result == nil{
            return "format error"
        }
    return result!
    }
}


