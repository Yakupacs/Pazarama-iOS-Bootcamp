//
//  MusicianStruct.swift
//  Structs
//
//  Created by Yakup on 21.10.2023.
//

import Foundation

// Free initializer
struct MusicianStruct {
	var name: String
	var age: Int
	var instrument: String
	
	mutating func happyBirthday(){
		self.age += 1
	}
}
