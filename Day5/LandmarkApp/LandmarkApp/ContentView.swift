//
//  ContentView.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack{
			VStack {
				List(landmarkList){ landmark in
					NavigationLink(destination: DetailView(selectedLandmark: landmark), label: {
						HStack {
							Image(landmark.image)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 60, height: 50)
								.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
							Text(landmark.name)
								.font(.custom("Avenir", size: 20))
						}
					}).padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
				}
			}.navigationTitle("Landmark Book")
		}
	}
}

#Preview {
	ContentView()
}
