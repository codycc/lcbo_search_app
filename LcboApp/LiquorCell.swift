//
//  LiquorCell.swift
//  LcboApp
//
//  Created by Cody Condon on 2016-09-21.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class LiquorCell: UITableViewCell {
    
    @IBOutlet weak var itemURL: UIImageView!

    @IBOutlet weak var ItemNameLbl: UILabel!
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var productSizeLbl: UILabel!
    
    
    func changeToDollars(price: Int) -> String  {
        let newPrice = Double(price)
        let newAmount = "$\(newPrice / 100.00)"
        return newAmount
    }
    

    func configureCell(liquor: LiquorResults) {
        ItemNameLbl.text = liquor.name
        // Change string of price in cents to and int
        let price_in_cents_int = Int(liquor.price_in_cents)
        // passing that int into my function and storing it as new format
        let formattedAmount = changeToDollars(price: price_in_cents_int!)
        //Updating the label with new formatted amount
        itemPriceLbl.text = formattedAmount
        
        productSizeLbl.text = liquor.package
        
        
        if let url = URL(string: liquor.itemURL) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.itemURL.image = UIImage(data: data)
                    }
                } catch {
                    // handle the error
                    print("there was an error with selected photo")
                }
            }
            
        }
   
    }

  

}
