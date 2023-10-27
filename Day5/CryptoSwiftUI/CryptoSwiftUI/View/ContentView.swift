//
//  ContentView.swift
//  CryptoSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var cryptoListViewModel: CryptoListViewModel
	
	init(){
		self.cryptoListViewModel = CryptoListViewModel()
	}
	
    var body: some View {
		NavigationStack{
			List(cryptoListViewModel.cryptoList, id: \.id){ crypto in
				VStack {
					Text(crypto.currency)
						.font(.custom("Avenir", size: 25))
						.foregroundStyle(.blue)
					.frame(maxWidth: .infinity, alignment: .leading)
					Text(crypto.price)
						.font(.custom("Avenir", size: 18))
						.foregroundStyle(.black)
						.frame(maxWidth: .infinity, alignment: .leading)
				}
			}.navigationTitle("Crpyto SwiftUI")
		}.task{
			await cryptoListViewModel.downloadCryptoAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
		}
	}
}

#Preview {
    ContentView()
}
