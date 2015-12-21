//
//  ViewController.swift
//  tips
//
//  Created by Matt on 12/13/15.
//  Copyright © 2015 Matt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages:[Double] = [0.18,0.2,0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //load the bill
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var billText = defaults.objectForKey("bill") as? String
        
        //update the bill
        if billText != ""{
            billField.text = billText
            onEditingChanged(billField)
        }else{
            billField.text = "0.00"
            onEditingChanged(billField)
        }
    }
    
    //animate loading and closing views
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //load the default settings
        let defaults = NSUserDefaults.standardUserDefaults()
        let first = defaults.integerForKey("first")
        let second = defaults.integerForKey("second")
        let third = defaults.integerForKey("third")
        
        
        tipControl.setTitle(String(first)+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(second)+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(third)+"%", forSegmentAtIndex: 2)
        
        tipPercentages[0] = Double(first)/100
        tipPercentages[1] = Double(second)/100
        tipPercentages[2] = Double(third)/100
        
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        //number formatter for the currency
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        let selected = tipControl.selectedSegmentIndex
        //the text from the textbox
        let billstring:String = NSString(string: billField.text!) as String
        //get the bill amount
        let billAmnt = NSString(string: billField.text!).doubleValue
        
        let defaults = NSUserDefaults.standardUserDefaults()
        //save the bill amount
        defaults.setObject(billstring, forKey: "bill")

        
        let tip = billAmnt * tipPercentages[selected]
        let total = billAmnt + tip
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

}

