//
//  ThirdView.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
		// Hashable List
		VStack {
			List(userList){ user in
				HStack {
					Image(systemName: "car.fill")
					Text(user.name)
				}
			}
		}
		// Identifiable List
		List(userList, id: \.self){ user in
			HStack {
				Image(systemName: "heart.fill")
				Text(user.name)
			}
		}
		// ForEach List
		List{
			ForEach(userList){ user in
				HStack {
					Image(systemName: "star.fill")
					Text(user.name)
				}
			}
		}
    }
}

#Preview {
    ThirdView()
}
