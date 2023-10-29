//
//  WebServiceProtocol.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

protocol WebServiceProtocol{
	func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ())
}
