//
//  ErrorMessageView.swift
//  viqana
//
//  Created by Ahmad Younis on 12/24/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class ErrorMessageView: UIView {
    weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        addSubview(label)
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        (label.leadingAnchor.constraint(equalTo: leadingAnchor)).isActive = true
        (label.trailingAnchor.constraint(equalTo: trailingAnchor)).isActive = true
        (label.topAnchor.constraint(equalTo: topAnchor)).isActive = true
        (label.bottomAnchor.constraint(equalTo: bottomAnchor)).isActive = true
        self.label = label
        
        
        backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
        layer.masksToBounds = true
        layer.cornerRadius = 6
        label.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
