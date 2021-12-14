//
//  LocalizableView.swift
//  IBLocalizable
//
//  Created by Chris Jimenez on 7/29/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

// MARK: - Base Class implementation extension
extension UIView : Localizable {
    
    private static var _localizableStringKeys = [String: String]()
    
    public var localizableStringKey: String {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIView._localizableStringKeys[tmpAddress] ?? ""
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIView._localizableStringKeys[tmpAddress] = newValue
        }
    }

    
    /// Not implemented in base class
   @objc public var localizableProperty: String?{
        get{
            return ""
        }
        set{}
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
            /**
             *  Applys the localization to the property
             */
            applyLocalizableString(newValue)
            self.localizableStringKey = newValue
        }
    }
    
    //initializer for programatic use
    convenience init(_ localizableString: String,_ frame: CGRect) {
        
        self.init(frame: frame)
        self.localizableString = localizableString
    }
    
}
