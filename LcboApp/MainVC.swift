//
//  ViewController.swift
//  LcboApp
//
//  Created by Cody Condon on 2016-09-21.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import Alamofire


class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var liquorResults: LiquorResults!
    var liquorArr = [LiquorResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        //searchBar.delegate = self
        self.downloadLiquorData {
            
        }
    }
    
    func downloadLiquorData(completed: @escaping DownloadComplete) {
        //Downloading liquor data for tableview 
        let liquorURL = URL(string: FULL_URL)!
        
        Alamofire.request(liquorURL).responseJSON { response in
            let result = response.result
            // run through every rslt in the api and store each item in the liquor array
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let rslt = dict["result"] as? [Dictionary<String, AnyObject>] {
                    for obj in rslt {
                        // passing in each object into the liquorresults class
                        let liquorResult = LiquorResults(liquorDict: obj)
                        self.liquorArr.append(liquorResult)
                        print(obj)
                    }
                    //dont forget to reload the data
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liquorArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Grab the item out of the array that corresponds with the indexpath.row 
        var selectedLiquor: LiquorResults!
        selectedLiquor = liquorArr[indexPath.row]
        print(selectedLiquor)
        performSegue(withIdentifier: "LiquorDetailVC", sender: selectedLiquor)
    }
    
    // going through the liquor array and storing each one in a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LiquorCell", for: indexPath) as? LiquorCell {
            // pull out each liquor from the liquor array
            let liquor = liquorArr[indexPath.row]
            //passing that instance to the configure cell function
            cell.configureCell(liquor: liquor)
            return cell
        } else {
            return LiquorCell()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the segue is called liquordetailvc
        if segue.identifier == "LiquorDetailVC" {
            // if the destination is the liquor detail view controller
            if let detailsVC = segue.destination as? LiquorDetailVC {
               // if the info is an instance of liquor results
                if let liquor2 = sender as? LiquorResults {
                    // this instance sends through to the variable on the other side 
                    detailsVC.liquor = liquor2
                }
            }
        }
    }
}

