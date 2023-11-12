//
//  CurrencyViewController.swift
//  Coin Exchange Capstone iOS Development
//
//  Created by Pawan Sethi on 11/10/23.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var SelectView: UIPickerView!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var convertedAmountLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    
    var currencies = [Currency]()
    var selectedCurrency: Currency?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRoundedAndShadowed(view: SelectView)
        makeRoundedAndShadowed(view: convertButton)
        makeRoundedAndShadowed(view: convertedAmountLabel)
        makeRoundedAndShadowed(view: amountTextField)
        
        // Do any additional setup after loading the view.
        SelectView.delegate = self
        SelectView.dataSource = self
        amountTextField.delegate = self
        convertButton.setTitle("Convert", for: .normal)
        convertedAmountLabel.text = ""
        
    downloadJSON {
                self.currencies.sort { $0.code < $1.code }
                self.SelectView.reloadAllComponents()
            }
        
        convertButton.addTarget(self, action: #selector(convertButtonPressed), for: .touchUpInside)

        }

        // MARK: - UIPickerViewDataSource

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return currencies.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return currencies[row].code
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedCurrency = currencies[row]
            convertAmount()
        }

        // MARK: - UITextFieldDelegate

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Allow only numeric input
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            convertAmount()
        }

        // MARK: - Helper Functions

    func convertAmount() {
            guard let selectedCurrency = selectedCurrency,
                  let amountText = amountTextField.text,
                  let amount = Double(amountText) else {
                return
            }

            let convertedAmount = amount * selectedCurrency.rate
            convertedAmountLabel.text = String(format: "%.2f", convertedAmount)
        }

        @objc func convertButtonPressed() {
            
            convertedAmountLabel.text = nil
            convertAmount()
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
    
    func makeRoundedAndShadowed(view: UIView) {
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 5.0
    }
}
