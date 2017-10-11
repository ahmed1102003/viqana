//
//  ViewController5Jacket.swift
//  viqana
//
//  Created by Ahmad Younis on 9/29/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class ViewController5Jacket: UIViewController {

    @IBOutlet weak var Add: UIButton!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet var popupViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var popupViewTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        popupViewBottomConstraint.isActive = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func addToBagTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.popupViewBottomConstraint.isActive = true
            self.popupViewTopConstraint.isActive = false
            self.view.layoutIfNeeded()
        }
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
