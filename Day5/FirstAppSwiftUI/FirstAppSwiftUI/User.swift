//
//  User.swift
//  FirstAppSwiftUI
//
//  Created by Yakup on 27.10.2023.
//

import Foundation

struct User: Identifiable, Hashable{
	
	var id = UUID()
	
	let name: String
}

var user1 = User(name: "Atıl")
var user2 = User(name: "Yakup")
var user3 = User(name: "Fatma")
var user4 = User(name: "Ali")
var user5 = User(name: "Muhammed")
var user6 = User(name: "Muhammed")

var userList = [user1, user2, user3, user4, user5, user6]
