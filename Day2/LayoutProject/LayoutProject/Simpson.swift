//
//  Simpson.swift
//  LayoutProject
//
//  Created by Yakup on 15.10.2023.
//

import Foundation
import UIKit

class Simpson{
	var name: String
	var age: String
	var job: String
	var imageString: UIImage
	
	init(name: String, age: String, job: String, imageString: UIImage) {
		self.name = name
		self.age = age
		self.job = job
		self.imageString = imageString
	}
}

class SelectedSimpson{
	static let shared = SelectedSimpson()
	var selected: Simpson?
	private init(selected: Simpson? = nil) {
		self.selected = selected
	}
}
