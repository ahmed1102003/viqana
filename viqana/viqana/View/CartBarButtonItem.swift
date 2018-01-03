//
//  CartBarButtonItem.swift
//  viqana
//
//  Created by Ahmad Younis on 1/2/18.
//  Copyright © 2018 Ahmad Younis. All rights reserved.
//

import UIKit


class CartBarButtonItem: UIBarButtonItem {
    override required init() {
        
        
        let countLabel = UILabel()
        countLabel.textAlignment = .center
        countLabel.textColor = .white
        countLabel.frame = CGRect(x: 15, y: -10, width: 25, height: 25)
        // I am trying to add color backround to the number on the top right  AY
        countLabel.backgroundColor = UIColor(red: 1, green:
            102/255.0, blue:102/255.0, alpha: 1)
        //countLabel.clipsToBounds = true
        countLabel.layer.masksToBounds = true
        countLabel.layer.cornerRadius = countLabel.bounds.size.width / 2
        
        // End of my adding AY the red is there but it's not circle
        
        let imageView = UIImageView()
        //imageView.image = #imageLiteral(resourceName: "Jacket7")
         imageView.image = #imageLiteral(resourceName: "s2")
        imageView.isHidden = true
        // imageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.addSubview(countLabel)
        
        super.init()
        self.customView = imageView
        self.countLabel = countLabel
        self.imageView = imageView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private weak var countLabel: UILabel!
    private weak var imageView: UIImageView!
    
    var count: Int = 0 {
        didSet {
            countLabel.text = "\(count)"
            imageView.isHidden = count <= 0
        }
    }
}

