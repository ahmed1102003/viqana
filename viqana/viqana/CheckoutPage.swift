//
//  checkoutPage.swift
//  viqana
//
//  Created by Ahmad Younis on 1/6/18.
//  Copyright © 2018 Ahmad Younis. All rights reserved.
//

import UIKit
import PassKit

class CheckoutPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var vStack: UIStackView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
      /*  tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250*/
        tableView.rowHeight = 200
        
        let payButton = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .white)
    
        vStack.addArrangedSubview(payButton)
        payButton.addTarget(self, action: #selector(pay), for: .touchUpInside)
        
    }
    
    @objc func pay() {
        
        let request = PKPaymentRequest()
        request.merchantIdentifier = ".com.ahmadscompany"
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "skirt", amount: NSDecimalNumber(string: "100"))
        ]
        let paySheet = PKPaymentAuthorizationViewController(paymentRequest: request)!
        present(paySheet, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutItemCell", for: indexPath) as! CheckoutItemCell
        let model = (cart[indexPath.row],1)
        cell.model = model
        return cell
    }
}

class CheckoutItemCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    
    var model: (Item, Int)? {
        didSet {
            let item = model?.0
            let qty = model?.1
            itemImageView.image = item?.image
            priceLabel.text = "\(item.map { $0.price * Double(qty ?? 0) } ?? 0)"
            
         //  AY trying to add the price from teh first name which is $110
        // priceLabel.text= ""
            
            nameLabel.text = item?.name ?? ""
            sizeLabel.text = item?.size.text ?? ""
            qtyLabel.text = "\(qty ?? 0)"
        }
    }
}
