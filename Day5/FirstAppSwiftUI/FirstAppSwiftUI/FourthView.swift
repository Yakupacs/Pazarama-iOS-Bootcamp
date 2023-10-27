//
//  FourthView.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct FourthView: View {
	
	@State var name = "Yakup Açış"
	
    var body: some View {
		VStack{
			Text(name)
				.font(.custom("Avenir", fixedSize: 30))
				.bold()
				.padding()
			Button("Tap now") {
				self.name = "Açış Yakup"
			}
			.buttonStyle(.borderedProminent)
			.font(.custom("Avenir", fixedSize: 20))
			.bold()
		}
    }
}

#Preview {
    FourthView()
}
