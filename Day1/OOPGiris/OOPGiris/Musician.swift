//
//  Musician.swift
//  OOPGiris
//
//  Created by Yakup on 14.10.2023.
//

import Foundation

enum MusicianType {
	case Baterist
	case Gitarist
}

class Musician {
	var name: String
	var age: Int
	var instrument: String
	var musicianType: MusicianType
	
	init(name: String, age: Int, instrument: String, musicianType: MusicianType) {
		self.name = name
		self.age = age
		self.instrument = instrument
		self.musicianType = musicianType
	}
	
	func function(){
		print("function")
	}
	
	private func privateFunction(){
		print("privateFunction")
	}
	
	func sum(x: Int, y: Int){
		print(x + y)
	}
	
	func sum(x: Int, y: Int, z: Int){
		print(x + y + z)
	}
}
