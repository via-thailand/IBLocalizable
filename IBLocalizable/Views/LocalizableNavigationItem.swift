//
//  LocalizableNavigationItem.swift
//  IBLocalizable
//
//  Created by Chris Jimenez on 7/29/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

// MARK: - Navigation item extension that adds the localizable property
extension UINavigationItem: Localizable {
    
    private static var _localizableStringKeys = [String: String]()
    
    public var localizableStringKey: String {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UINavigationItem._localizableStringKeys[tmpAddress] ?? ""
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UINavigationItem._localizableStringKeys[tmpAddress] = newValue
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
