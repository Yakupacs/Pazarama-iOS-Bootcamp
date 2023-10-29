//
//  ViewController.swift
//  MealAppProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import UIKit
import SDWebImage

class HomepageVC: UIViewController, MealViewModelOutput {

	var mealViewModel: MealViewModel?
	
	var meal: Meal?
	
	var collectionView: UICollectionView?
	
	init(mealViewModel: MealViewModel){
		self.mealViewModel = mealViewModel
		super.init(nibName: nil, bundle: nil)
		// Add random 15 meal
		for _ in 0..<15 {
			mealViewModel.fetchMeals()
		}
		mealViewModel.output = self
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setupView()
	}

	func updateView(meals: Meal) {
		DispatchQueue.main.async{
			self.meal = meals
			self.collectionView?.reloadData()
		}
	}
}

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource{
	func setupView(){
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 24)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.text = "Meals App"
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
			label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
			label.heightAnchor.constraint(equalToConstant: 50)
		])
		
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.minimumInteritemSpacing = 5
		layout.minimumLineSpacing = 5
		layout.scrollDirection = .vertical
		let width = UIScreen.main.bounds.width
		let itemWidth = (width - 10) / 2
		layout.itemSize = CGSize(width: itemWidth, height: 240)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView?.register(MealCollectionCell.self, forCellWithReuseIdentifier: "cell")
		collectionView?.showsVerticalScrollIndicator = false
		collectionView?.showsHorizontalScrollIndicator = false
		collectionView?.translatesAutoresizingMaskIntoConstraints = false
		collectionView?.backgroundColor = .clear
		view.addSubview(collectionView!)
		
		NSLayoutConstraint.activate([
			collectionView!.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
			collectionView!.leftAnchor.constraint(equalTo: view.leftAnchor),
			collectionView!.rightAnchor.constraint(equalTo: view.rightAnchor),
			collectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		collectionView?.delegate = self
		collectionView?.dataSource = self
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return meal?.meals.count ?? 0
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let meal{
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MealCollectionCell
			cell.setup(meal: meal, indexPath: indexPath)
			return cell
		}
		return UICollectionViewCell()
	}
}
