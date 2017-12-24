//
//  ViewController1.swift
//  viqana
//
//  Created by Ahmad Younis on 9/30/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBAction func Sizeguide(_ sender: Any) {
    }
    @IBOutlet weak var x2sButton: UIButton!
    
    
    @IBOutlet weak var xsButton: UIButton!
    
    @IBOutlet weak var SButton: UIButton!
    
    @IBOutlet weak var MButton: UIButton!
    
    @IBOutlet weak var LButton: UIButton!
    
    @IBOutlet weak var XLButton: UIButton!
    
    
    @IBOutlet var popupBottomConstraint: NSLayoutConstraint!
    @IBOutlet var popupTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
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
    
    
    @IBOutlet weak var add: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var qtyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupBottomConstraint.isActive = false
        // Do any additional setup after loading the view.
        
        let spacing: CGFloat = 12
        xsButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
         SButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: spacing, bottom: 20, right: spacing)
         MButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: spacing, bottom: 20, right: spacing)
         LButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: spacing, bottom: 20, right: spacing)
         XLButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: spacing, bottom: 20, right: spacing)
        
        xsButton.setTitleColor(.black, for: .normal)
        xsButton.titleLabel?.font = .systemFont(ofSize: 21)

    }

    @IBAction func minusButtonTapped(_ sender: Any) {
        qty = max(1, qty - 1)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        qty = qty + 1
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToBagTapped(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            self.popupBottomConstraint.isActive = true
            self.popupTopConstraint.isActive = false
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
