//
//  FifthView.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct FifthView: View {
	
	@State var kullanici_adi = "Selam"
	
    var body: some View {
        Text(kullanici_adi)
			.font(.custom("Avenir", size: 30))
			.bold()
		TextField("İsim giriniz", text: $kullanici_adi)
			.font(.custom("Avenir", size: 25))
			.border(.black)
			.padding()
		Button("Login"){
			kullanici_adi = ""
		}
		.buttonStyle(.borderedProminent)
    }
}

#Preview {
    FifthView()
}
