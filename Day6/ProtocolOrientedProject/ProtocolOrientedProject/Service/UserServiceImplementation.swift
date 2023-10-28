//
//  APIManager.swift
//  ProtocolOrientedProject
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

// Strategy Pattern
protocol UserService{
	func fetchUser(completion: @escaping (Result<User, Error>) -> ())
}

class UserServiceImplementation: UserService{
	
	// Singleton Pattern
	static let shared = UserServiceImplementation()
	
	init() {}
	
	func fetchUser(completion: @escaping (Result<User, Error>) -> ()){
		let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			DispatchQueue.main.async{
				if let user = try? JSONDecoder().decode([User].self, from: data).last{
					completion(.success(user))
				}else{
					completion(.failure(error!))
				}
			}
		}.resume()
	}
}
