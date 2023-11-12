//
//  ViewController.swift
//  Coin Exchange Capstone iOS Development
//
//  Created by Pawan Sethi on 11/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currencies = [Currency]()
    
    @IBOutlet weak var ScrollViewCurrency: UIScrollView!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
                    self.currencies.sort { $0.code < $1.code }
                    self.setupCurrencyLabels()
                    print("Success!")
                }
            }

    func setupCurrencyLabels() {
            let labelWidth: CGFloat = 140
            let labelHeight: CGFloat = 30
            let horizontalSpacing: CGFloat = 40
            let verticalSpacing: CGFloat = 30
            let contentWidth = labelWidth * 2 + horizontalSpacing
            let contentHeight = CGFloat(currencies.count) * (labelHeight + verticalSpacing)
            var yOffset = max((ScrollViewCurrency.bounds.height - contentHeight) / 2, 0)

            for currency in currencies {
                let currencyLabel = UILabel()
                currencyLabel.text = currency.code
                currencyLabel.textAlignment = .left
                currencyLabel.frame = CGRect(x: (ScrollViewCurrency.bounds.width - contentWidth) / 2, y: yOffset, width: labelWidth, height: labelHeight)

                let rateLabel = UILabel()
                let roundedRate = String(format: "%.4f", currency.rate)
                rateLabel.text = roundedRate
                rateLabel.textAlignment = .right
                rateLabel.frame = CGRect(x: currencyLabel.frame.maxX + horizontalSpacing, y: yOffset, width: labelWidth, height: labelHeight)

                ScrollViewCurrency.addSubview(currencyLabel)
                ScrollViewCurrency.addSubview(rateLabel)

                yOffset += labelHeight + verticalSpacing
            }

            // Set the content size of the scroll view based on the yOffset
        ScrollViewCurrency.contentSize = CGSize(width: ScrollViewCurrency.bounds.width, height: max(yOffset - verticalSpacing, ScrollViewCurrency.bounds.height))
        }
    
        func downloadJSON(completed: @escaping () -> ()) {
            let apiKey = "14b4408bd9af95c2192fb4e9"  // Replace with your actual API key
            let baseCurrency = "USD"

            let url = URL(string: "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/\(baseCurrency)")!

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data from the API: \(error)")
                    return
                }

                guard let data = data else {
                    print("No data received from the API")
                    return
                }

                do {
                    let exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: data)

                    // Extract currencies from the response and store them in your array
                    self.currencies = exchangeRates.conversion_rates.map { Currency(code: $0.key, rate: $0.value) }

                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
    }
