//
//  Product.swift
//  viqana
//
//  Created by Ahmad Younis on 3/29/18.
//  Copyright © 2018 Ahmad Younis. All rights reserved.
//

import Foundation
import UIKit

struct ProductCategory {
    let name: String
    let products: [Product]
    var image: UIImage {
        return products.first?.image ?? UIImage()
    }
}

struct Product {
    let image: UIImage
    let name: String
    let price: Double
}

