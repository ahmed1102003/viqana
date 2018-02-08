//
//  checkoutPage.swift
//  viqana
//
//  Created by Ahmad Younis on 1/6/18.
//  Copyright © 2018 Ahmad Younis. All rights reserved.
//

import UIKit

class CheckoutPage: UITableViewController {
    

    
    override func viewDidLoad() {
    super.viewDidLoad()
      /*  tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250*/
        tableView.rowHeight = 200
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            nameLabel.text = item?.name ?? ""
            sizeLabel.text = item?.size.text ?? ""
            qtyLabel.text = "\(qty ?? 0)"
        }
    }
}
