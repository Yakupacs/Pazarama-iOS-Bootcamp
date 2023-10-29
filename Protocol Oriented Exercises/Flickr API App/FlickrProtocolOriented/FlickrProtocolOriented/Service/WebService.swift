//
//  WebService.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

class WebService: WebServiceProtocol{
	static let shared = WebService()
	
	init() {}
	
	func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> ()){
		let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=89f071815e4147386eae6466ed6d5b44&format=json&nojsoncallback=1&extras=description,owner_name,icon_server,url_n,url_z")!
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let data{
				do {
					let photos = try JSONDecoder().decode(Photos.self, from: data)
					completion(.success(photos.photos.photo))
				} catch {
					completion(.failure(error))
				}
			}else if let error{
				completion(.failure(error))
			}
		}.resume()
	}
}
