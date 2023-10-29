//
//  Photo.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

// MARK: - Photos
struct Photos: Codable {
	let photos: PhotosClass
	let stat: String
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
	let page, pages, perpage, total: Int
	let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
	let id, owner, secret, server: String
	let farm: Int
	let title: String
	let ispublic, isfriend, isfamily: Int
	let description: Description
	let ownername, iconserver: String
	let iconfarm: Int
	let urlN: String?
	let heightN, widthN: Int?
	let urlZ: String?
	let heightZ, widthZ: Int?

	enum CodingKeys: String, CodingKey {
		case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, description, ownername, iconserver, iconfarm
		case urlN = "url_n"
		case heightN = "height_n"
		case widthN = "width_n"
		case urlZ = "url_z"
		case heightZ = "height_z"
		case widthZ = "width_z"
	}
}

// MARK: - Description
struct Description: Codable {
	let content: String

	enum CodingKeys: String, CodingKey {
		case content = "_content"
	}
}
