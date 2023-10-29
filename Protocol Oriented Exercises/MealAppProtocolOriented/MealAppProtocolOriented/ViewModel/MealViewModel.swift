//
//  MealViewModel.swift
//  MealAppProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import Foundation

class MealViewModel{

	private let webServiceProtocol: WebServiceProtocol

	var output: MealViewModelOutput?
	
	var allMeals: Meal?
	
	init(webServiceProtocol: WebServiceProtocol) {
		self.webServiceProtocol = webServiceProtocol
	}
	
	func fetchMeals(){
		webServiceProtocol.fetchMeals(completion: { result in
			switch result{
			case .success(let meal):
				if self.allMeals != nil{
					self.allMeals!.meals.append(meal.meals.first!)
				}else{
					self.allMeals = meal
				}
				self.output?.updateView(meals: self.allMeals!)
			case .failure(_):
				self.output?.updateView(meals: Meal(meals: []))
			}
		})
	}
}
