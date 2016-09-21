//
//  Liquor.swift
//  LcboApp
//
//  Created by Cody Condon on 2016-09-21.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import Foundation

class Liquor {
    private var _name: String!
    private var _price_in_cents: String!
    private var _description: String!
    private var _category: String!
    private var _package: String!
    private var _alcohol_content: String!
    private var _imageURL: String!
  
    
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
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var category: String {
        if _category == nil {
            _category = ""
        }
        return _category
    }
    
    var package: String {
        if _package == nil {
            _package = ""
        }
        return _package
    }
    
    var alcohol_content: String {
        if _alcohol_content == nil {
            _alcohol_content = ""
        }
        return _alcohol_content
    }
    
    var imageURL: String {
        if _imageURL == nil {
            _imageURL = ""
        }
        return _imageURL
    }
}
