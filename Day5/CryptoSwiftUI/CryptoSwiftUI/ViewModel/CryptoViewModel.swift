//
//  CryptoViewModel.swift
//  CryptoSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import Foundation

class CryptoListViewModel: ObservableObject{

	@Published var cryptoList = [CryptoViewModel]()
	@Published var errorMessage = String()
	
	let webservice = Webservice()
	
	func downloadCryptoAsync(url: URL) async {
		do {
			let cryptoList = try await webservice.downloadCurrenciesAsync(url: url)
			DispatchQueue.main.async {
				self.cryptoList = cryptoList.map(CryptoViewModel.init)
			}
		} catch {
			print(error.localizedDescription)
		}
		
	}
	
	func downloadCrypto(url: URL){
		webservice.downloadCurrencies(url: url) { result in
			switch result{
			case .success(let cryptos):
				DispatchQueue.main.async {
					self.cryptoList = cryptos.map(CryptoViewModel.init)
				}
			case .failure(let error):
				switch error{
				case .badURL:
					self.errorMessage = "Bad URL!"
				case .decodingError:
					self.errorMessage = "Decoding Error!"
				case .serverError:
					self.errorMessage = "Server Error!"
				}
			}
		}
	}
}

struct CryptoViewModel{
	let crypto: Crypto
	
	var id: UUID? {
		crypto.id
	}
	var currency: String{
		crypto.currency
	}
	var price: String{
		crypto.price
	}
}
