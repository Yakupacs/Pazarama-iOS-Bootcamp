//
//  ToggleView.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct ToggleView: View {
	
	@State var shown = false
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
		
		Button("Open to screen"){
			self.shown = true
		}.sheet(isPresented: $shown, content: {
			DetailView(selectedLandmark: land1)
		})
    }
}

#Preview {
    ToggleView()
}
