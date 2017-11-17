//
//  ViewController3.swift
//  viqana
//
//  Created by Ahmad Younis on 9/30/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    var qty: Int = 1 {
        didSet {
            updateQtyLabel()
        }
    }
    func updateQtyLabel() {
         qtyLabel.text = "\(qty)"
        if qty <= 1 {
            minusButton.isEnabled = false
        } else {
            minusButton.isEnabled = true
        }
    }

    @IBOutlet weak var minusButton: UIButton!
    // @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    
    @IBOutlet weak var Sizeguide: UIButton!
    
    
    @IBOutlet weak var qtyLabel: UILabel!
    
    @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    // @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var xsButton: UIButton!
    
    @IBOutlet weak var sButton: UIButton!
    
    @IBOutlet weak var mButton: UIButton!
    
    @IBOutlet weak var xlButton: UIButton!
    
    @IBOutlet weak var lButton: UIButton!
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQtyLabel()
        popupBottomConstrain.isActive = false

        // Do any additional setup after loading the view.
    
    
    let spacing: CGFloat = 12
    
    xsButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    sButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    mButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    lButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    xlButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    
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
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        qty = max(1, qty - 1)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        qty = qty + 1
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
