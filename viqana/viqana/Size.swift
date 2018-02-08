//
//  Size.swift
//  viqana
//
//  Created by Ahmad Younis on 12/24/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import Foundation
import UIKit

enum Size {
    case xs
    case s
    case m
    case l
    case xl
    
    var text: String {
        switch self {
        case .xs: return "XS"
         case .s: return "S"
         case .m: return "M"
        case .l: return "L"
             case .xl: return "XL"
        }
    }
}
