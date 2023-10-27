//
//  OrnekView.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct OrnekView: View {
	
	@State var seen = false
	
    var body: some View {
		Text(self.seen ? "Görüldü" : "Görülmedi")
		
		CustomButton(seen: $seen)
    }
}

#Preview {
    OrnekView()
}
