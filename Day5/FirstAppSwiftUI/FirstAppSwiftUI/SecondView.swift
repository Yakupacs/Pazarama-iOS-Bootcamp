//
//  SecondView.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
		Circle()
			.frame(width: 100, height: 100)
		Capsule()
			.frame(width: 300, height: 300)
		HStack{
			Capsule()
				.frame(width: 35)
				.padding()
			Capsule()
				.frame(width: 35)
				.padding()
		}

	}
}

#Preview {
    SecondView()
}
