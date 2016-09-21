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

    func configureCell(liquor: LiquorResults) {
        ItemNameLbl.text = liquor.name
        itemPriceLbl.text = "\(liquor.price_in_cents)"
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
