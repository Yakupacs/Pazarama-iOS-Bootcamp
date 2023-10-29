//
//  WebService.swift
//  MealAppProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

class WebService: WebServiceProtocol{
	static let shared = WebService()
	
	init() {}
	
	func fetchMeals(completion: @escaping (Result<Meal, Error>) -> ()){
		let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let data{
				do {
					let meals = try JSONDecoder().decode(Meal.self, from: data)
					completion(.success(meals))
				} catch {
					completion(.failure(error))
				}
			}else if let error{
				completion(.failure(error))
			}
		}.resume()
	}
}
