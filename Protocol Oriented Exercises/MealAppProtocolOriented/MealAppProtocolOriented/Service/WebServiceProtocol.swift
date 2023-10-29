//
//  WebServiceProtocol.swift
//  MealAppProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

protocol WebServiceProtocol{
	func fetchMeals(completion: @escaping (Result<Meal, Error>) -> ())
}
