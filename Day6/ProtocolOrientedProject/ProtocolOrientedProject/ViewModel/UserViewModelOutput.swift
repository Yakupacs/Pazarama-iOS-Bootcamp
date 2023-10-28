//
//  UserViewModelOutput.swift
//  ProtocolOrientedProject
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

protocol UserViewModelOutput{
	func updateView(name: String, username: String, email: String)
}
