//
//  PhotoViewModel.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

class PhotoViewModel{
	
	private let webServiceProtocol: WebServiceProtocol
	
	var output: PhotoViewModelOutput?
	
	init(webServiceProtocol: WebServiceProtocol) {
		self.webServiceProtocol = webServiceProtocol
	}
	
	func requestPhotos(){
		webServiceProtocol.fetchPhotos { result in
			switch result{
			case .success(let photos):
				self.output?.viewUpdate(photos: photos)
			case .failure(_):
				self.output?.viewUpdate(photos: [])
			}
		}
	}
}
