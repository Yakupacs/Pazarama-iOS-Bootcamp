//
//  CryptoViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Yakup on 21.10.2023.
//

import Foundation
import RxSwift

class CryptoViewModel {
	var cryptos: PublishSubject<[Crypto]> = PublishSubject()
	let error: PublishSubject<String> = PublishSubject()
	let loading: PublishSubject<Bool> = PublishSubject()

	func requestData(){
		self.loading.onNext(true)
		sleep(5)
		let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
		
		WebService().downloadCurrencies(url: url) { result in
			switch result{
			case .success(let cryptos):
				self.cryptos.onNext(cryptos)
			case .failure(let error):
				switch error{
				case .decodingError:
					self.error.onNext("Decoding Error!")
				case .serverError:
					self.error.onNext("Server Error!")
				case .urlError:
					self.error.onNext("URL Error!")
				}
			}
			self.loading.onNext(false)
		}
	}
}
