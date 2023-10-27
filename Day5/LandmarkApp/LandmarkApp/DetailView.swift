//
//  DetailView.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct DetailView: View {
	
	let selectedLandmark: Landmark
	
    var body: some View {
		Text(selectedLandmark.name)
			.font(.custom("Avenir", size: 35))
			.padding()
		Image(selectedLandmark.image)
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
		Text(selectedLandmark.country)
			.font(.custom("Avenir", size: 30))
			.padding()
		Text(selectedLandmark.year)
			.font(.custom("Avenir", size: 25))
			.padding()
	}
}

#Preview {
    DetailView(selectedLandmark: land1)
}
