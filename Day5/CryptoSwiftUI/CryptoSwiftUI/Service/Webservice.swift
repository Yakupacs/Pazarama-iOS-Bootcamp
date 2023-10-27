//
//  Webservice.swift
//  CryptoSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import Foundation

class Webservice{
	
	func downloadCurrenciesAsync(url: URL) async throws -> [Crypto]{
		let (data, _) = try await URLSession.shared.data(from: url)
		let currenciesList = try? JSONDecoder().decode([Crypto].self, from: data)
		return currenciesList ?? []
	}
	
	func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()){
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error{
				completion(.failure(.badURL))
			}
			guard let data = data, error == nil else { return completion(.failure(.serverError)) }
			
			guard let currenciesList = try? JSONDecoder().decode([Crypto].self, from: data) else { return completion(.failure(.decodingError)) }
			
			completion(.success(currenciesList))
		}.resume()
	}
}

enum CryptoError: Error{
	case badURL
	case decodingError
	case serverError
}
