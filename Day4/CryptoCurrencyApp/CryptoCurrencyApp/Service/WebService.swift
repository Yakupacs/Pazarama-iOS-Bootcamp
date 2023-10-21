//
//  WebService.swift
//  CryptoCurrencyApp
//
//  Created by Yakup on 21.10.2023.
//

import Foundation

enum CryptoError: Error{
	case serverError
	case decodingError
	case urlError
}

class WebService {
	func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()) {
		URLSession.shared.dataTask(with: url) { data, response, error in
			if error != nil {
				completion(.failure(CryptoError.serverError))
			}else if let data = data{
				do {
					let cryptoList = try JSONDecoder().decode([Crypto].self, from: data)
					completion(Result.success(cryptoList))
				} catch {
					completion(Result.failure(CryptoError.decodingError))
				}
			}
		}.resume()
	}
}
