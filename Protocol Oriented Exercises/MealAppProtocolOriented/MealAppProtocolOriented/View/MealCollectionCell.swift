//
//  MealCollectionCell.swift
//  MealAppProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import UIKit
import SDWebImage

class MealCollectionCell: UICollectionViewCell {
	var mealImageView: UIImageView = {
		var imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 20
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	var mealTitle: UILabel = {
		var label = UILabel()
		label.font = UIFont(name: "Avenir", size: 18)
		label.textAlignment = .center
		label.numberOfLines = 0
		label.minimumScaleFactor = 0.5
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView(){
		backgroundColor = .clear
		addSubview(mealImageView)
		addSubview(mealTitle)
		NSLayoutConstraint.activate([
			mealImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			mealImageView.widthAnchor.constraint(equalToConstant: 150),
			mealImageView.heightAnchor.constraint(equalToConstant: 150),
			mealImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			mealTitle.topAnchor.constraint(equalTo: mealImageView.bottomAnchor),
			mealTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
			mealTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
			mealTitle.heightAnchor.constraint(equalToConstant: 80)
		])
	}
	
	func setup(meal: Meal, indexPath: IndexPath){
		for mealAttribute in meal.meals[indexPath.row]{
			if mealAttribute.key == "strMealThumb"{
				mealImageView.sd_setImage(with: URL(string: mealAttribute.value!))
			}else if mealAttribute.key == "strMeal"{
				mealTitle.text = mealAttribute.value!
			}
		}
	}
}
