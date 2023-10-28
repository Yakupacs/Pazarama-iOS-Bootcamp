//
//  UserService.swift
//  ProtocolOrientedProject
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

protocol UserService{
	func fetchUser(completion: @escaping (Result<User, Error>) -> ())
}
