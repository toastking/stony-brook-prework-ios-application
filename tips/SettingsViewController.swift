//
//  SettingsViewController.swift
//  tips
//
//  Created by Matt on 12/14/15.
//  Copyright © 2015 Matt. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstPercent: UITextField!
    @IBOutlet weak var secondPercent: UITextField!
    @IBOutlet weak var thirdPercent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func editChanged(sender: AnyObject) {
        let first = Int(firstPercent.text!)
        let second = Int(secondPercent.text!)
        let third = Int(thirdPercent.text!)
        
        //load the user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        //add defaults from the settings
        defaults.setInteger(first!, forKey: "first")
        defaults.setInteger(second!, forKey: "second")
        defaults.setInteger(third!, forKey: "third")
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
