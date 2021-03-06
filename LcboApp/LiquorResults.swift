//
//  LiquorResults.swift
//  LcboApp
//
//  Created by Cody Condon on 2016-09-21.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import Alamofire

class LiquorResults {
    private var _name: String!
    private var _price_in_cents: String!
    private var _package: String!
    private var _itemURL: String!
    private var _description: String!
    private var _alcohol_content: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var price_in_cents: String {
        if _price_in_cents == nil {
            _price_in_cents = ""
        }
        return _price_in_cents
    }
    
    var package: String {
        if _package == nil {
            _package = ""
        }
        return _package
    }
    
    var itemURL: String {
        if _itemURL == nil {
            _itemURL = ""
        }
        return _itemURL
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var alcohol_content: String {
        if _alcohol_content == nil {
            _alcohol_content = ""
        }
        return _alcohol_content
    }
    

    //passing in a dictionary everytime we create an instance of liquor results 
    init(liquorDict: Dictionary<String, AnyObject>) {
        if let name = liquorDict["name"] as? String {
            self._name = name
        }
        
        if let price_in_cents = liquorDict["price_in_cents"] as? Int {
            self._price_in_cents = "\(price_in_cents)"
        }
        
        if let package = liquorDict["package"] as? String {
            self._package = package
        }
        
        if let URL = liquorDict["image_url"] as? String {
            self._itemURL = URL
        }
        
        if let description = liquorDict["description"] as? String {
            self._description = description
        }
        
        if let alcohol_content = liquorDict["alcohol_content"] as? Int {
            self._alcohol_content = "\(alcohol_content)"
        }
        
        
    }
    
}
