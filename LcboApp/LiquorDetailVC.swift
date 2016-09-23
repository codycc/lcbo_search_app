//
//  LiquorDetailVC.swift
//  LcboApp
//
//  Created by Cody Condon on 2016-09-22.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class LiquorDetailVC: UIViewController {
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemSizeLbl: UILabel!
    @IBOutlet weak var percentLbl: UILabel!
    
    var liquor: LiquorResults!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = liquor.name
        
        // changing pennies to dollars 
        let priceToInt = Int(liquor.price_in_cents)
        let formattedAmount = changeToDollars(price: priceToInt!)
        priceLbl.text = formattedAmount
        
        //changing proper alcohol content 
        let contentToInt = Int(liquor.alcohol_content)
        let formattedContent = convertAlcoholContent(amount: contentToInt!)
        percentLbl.text = formattedContent
        
        //updating other two labels
        itemSizeLbl.text = liquor.package
        // Do any additional setup after loading the view.
        
        if let url = URL(string: liquor.itemURL) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.itemImage.image = UIImage(data: data)
                    }
                } catch {
                    // handle the error
                    print("there was an error with selected photo")
                }
            }
            
        }
    }
    
    func changeToDollars(price: Int) -> String  {
        let newPrice = Double(price)
        let newAmount = "$\(newPrice / 100.00)"
        return newAmount
    }
    
    func convertAlcoholContent(amount: Int) -> String  {
        let newContent = Double(amount)
        let newAmount = "Alcohol Content: \(newContent / 100.00)% "
        return newAmount
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
