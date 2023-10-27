//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack{
			Form {
				Menu("Menu") {
					Text("Text 1")
					Text("Text 2")
					Text("Text 3")
				}
				DisclosureGroup("Disclosure Group") {
					EditButton()
					EditButton()
				}
				Picker(selection: .constant(1), label: Text("Picker")) {
					Text("Picker 1").tag(1)
					Text("Picker 2").tag(2)
				}
				EditButton()
				LabeledContent("LabeledContent") {
					EditButton()
				}
				Link(destination: URL(string: "www.google.com")!) {
					Text("Link")
				}
				Divider()
				ProgressView(value: 0.5)

				Spacer()
				RenameButton()
				SecureField("Password", text: .constant("yakupacs"))
				ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui")!)
				Slider(value: .constant(0.25))
				TextEditor(text: .constant("TextEditor"))
				TextField("TextField", text: .constant(""))
				RadialGradient(gradient: Gradient(colors: [Color.red.opacity(0.3), Color.red.opacity(1)]), center: .leading, startRadius: 10, endRadius: 500)
				Circle()
					.frame(width: 100, height: 100)
				Capsule()
				Ellipse()
			}
			.navigationTitle("Hello SwiftUI")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

#Preview {
    ContentView()
}
