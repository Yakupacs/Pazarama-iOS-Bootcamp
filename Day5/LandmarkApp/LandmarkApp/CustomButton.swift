//
//  CustomButton.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct CustomButton: View {
	
	@Binding var seen: Bool
	
	var body: some View {
		Button("Change"){
			self.seen.toggle()
		}
	}
}
