//
//  WebServiceProtocol.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

protocol WebServiceProtocol{
	func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> ())
}
