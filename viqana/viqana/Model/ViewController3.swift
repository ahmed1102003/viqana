//
//  ViewController3.swift
//  viqana
//
//  Created by Ahmad Younis on 9/30/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {


   // @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    
    @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    // @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupBottomConstrain.isActive = false

        // Do any additional setup after loading the view.
    }

    @IBAction func addToBagTapped2(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.popupBottomConstrain.isActive = true
            self.popupTopConstrain.isActive = false
            self.view.layoutIfNeeded()
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
