//
//  WebService.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

class WebService: WebServiceProtocol{
	static let shared = WebService()
	
	init() {}
	
	func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
		let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let data = data {
				do {
					let posts = try JSONDecoder().decode([Post].self, from: data)
					completion(.success(posts))
				} catch {
					completion(.failure(error))
				}
			}else if let error = error{
				completion(.failure(error))
			}
		}.resume()
	}
}
