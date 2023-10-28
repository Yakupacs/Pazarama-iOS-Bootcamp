//
//  Post.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 28.10.2023.
//

import Foundation

struct Post: Codable {
	let userID, id: Int
	let title, body: String

	enum CodingKeys: String, CodingKey {
		case userID = "userId"
		case id, title, body
	}
}
