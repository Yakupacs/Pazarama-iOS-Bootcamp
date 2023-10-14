//
//  MusicianProtocols.swift
//  OOPGiris
//
//  Created by Yakup on 14.10.2023.
//

import Foundation

protocol singASong{
	var variable: String { get }
	
	func song()
	func takeGuitar()
}

// Protokolü Conform etmek
class Singer: singASong{
	var variable: String = ""
	
	func song() {
		
	}
	
	func takeGuitar() {
		
	}
}
