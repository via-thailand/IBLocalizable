//
//  LocalizableUIBarItem.swift
//  IBLocalizable
//
//  Created by Chris Jimenez on 7/29/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

// MARK: - BarItem Extension that adds the localizable property
extension UIBarItem: Localizable {
    
    private static var _localizableStringKeys = [String: String]()
    
    public var localizableStringKey: String {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIBarItem._localizableStringKeys[tmpAddress] ?? ""
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIBarItem._localizableStringKeys[tmpAddress] = newValue
        }
    }

    
    public var localizableProperty: String?{
        get{
            return self.title
        }
        set{
            self.title = newValue
        }
    }
    
    /// Applies the localizable string to the localizable field of the supported view
    @IBInspectable public var localizableString: String{
        
        get{
            guard let text = self.localizableProperty else{
                return ""
            }
            return text
        }
        set{
            applyLocalizableString(newValue)
        }
        
    }
}
