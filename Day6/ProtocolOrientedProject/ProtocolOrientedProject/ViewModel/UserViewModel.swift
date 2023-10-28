//
//  UserViewModel.swift
//  ProtocolOrientedProject
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

class UserViewModel{
	
	// Dependency Injection
	private let userService: UserService
	
	var delegate: UserViewModelOutput?
	
	// Delegate Pattern
	init(userService: UserService) {
		self.userService = userService
	}
	
	func fetchUsers(){
		userService.fetchUser { result in
			switch result{
			case .success(let user):
				self.delegate?.updateView(name: user.name, username: user.username, email: user.email)
			case .failure(_):
				self.delegate?.updateView(name: "No user", username: "", email: "")
			}
		}
	}
}
