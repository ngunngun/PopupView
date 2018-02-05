//
//  UIDevice.swift
//  CustomView
//
//  Created by Lullaby on 5/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    class func isIpad() -> Bool {
        return UIDevice().userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
}
