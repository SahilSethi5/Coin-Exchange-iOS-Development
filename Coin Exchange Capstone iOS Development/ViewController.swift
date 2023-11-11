//
//  ViewController.swift
//  Coin Exchange Capstone iOS Development
//
//  Created by Pawan Sethi on 11/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var CurrencyTableView: UITableView!
    
    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadJSON {
            self.CurrencyTableView.reloadData()
            print("Success!")
        }
        
        CurrencyTableView.delegate = self
        CurrencyTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let currency = currencies[indexPath.row]
        cell.textLabel?.text = currency.AUD.lowercased()
        
        return cell
    }
    
    func downloadJSON(completed: @escaping () -> ()){
     
        let url = URL(string: "https://v6.exchangerate-api.com/v6/14b4408bd9af95c2192fb4e9/latest/USD")
        
        URLSession.shared.dataTask(with: url!) {data, response, err in
            
            if err == nil {
                
                do {
                    self.currencies = try JSONDecoder().decode([Currency].self, from: data!)
                }
                catch{
                    print("Error fetching data from the api")
                }
                
            }
        }.resume()
        
    }


}

