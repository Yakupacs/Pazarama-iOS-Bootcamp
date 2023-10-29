//
//  PostViewModel.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

class PostViewModel{
	
	private let webServiceProtocol: WebServiceProtocol
	
	var output: PostViewModelOutput?
	
	init(webServiceProtocol: WebServiceProtocol) {
		self.webServiceProtocol = webServiceProtocol
	}
	
	func fetchPosts(){
		webServiceProtocol.fetchPosts { result in
			switch result{
			case .success(let posts):
				self.output?.updateView(post: posts)
			case .failure(_):
				self.output?.updateView(post: [])
			}
		}
	}
}
