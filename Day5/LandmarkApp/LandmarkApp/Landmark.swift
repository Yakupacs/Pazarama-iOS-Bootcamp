//
//  Landmark.swift
//  LandmarkApp
//
//  Created by Yakup on 27.10.2023.
//

import Foundation

struct Landmark: Identifiable{
	let id = UUID()
	let name: String
	let image: String
	let country: String
	let year: String
}

let land1 = Landmark(name: "Galata Tower", image: "image1", country: "Türkiye", year: "1564")
let land2 = Landmark(name: "Pisa Tower", image: "image2", country: "Italy", year: "1753")
let land3 = Landmark(name: "Colesseum", image: "image3", country: "Türkiye", year: "1400")

let landmarkList = [land1, land2, land3]
