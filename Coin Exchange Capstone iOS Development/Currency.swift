//
//  Currency.swift
//  Coin Exchange Capstone iOS Development
//
//  Created by Sahil Sethi on 11/10/23.
//

import Foundation

struct Currency: Codable {
    let code: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case code
        case rate = "Rate"  // Use the actual key from your JSON response
    }
}

struct ExchangeRates: Codable {
    let base_code: String
    let conversion_rates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case base_code = "base_code"
        case conversion_rates = "conversion_rates"
    }
}
