//
//  CollectionVC.swift
//  AdvancedProgrammatic
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class CollectionVC: UIViewController {

	var myCollectionView: UICollectionView?
	var simpsons = [Simpson]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		dataUpload()
		setupCollectionView()
		
		myCollectionView?.delegate = self
		myCollectionView?.dataSource = self
		
		self.navigationItem.title = "Simpsons"
    }
	func dataUpload(){
		let homer1 = Simpson(name: "Homer Simpson", job: "34", age: "Nükleer", imageString: "homerSimpson")
		let homer2 = Simpson(name: "Bart Simpson", job: "14", age: "Öğrenci", imageString: "bartSimpson")
		let homer3 = Simpson(name: "Lisa Simpson", job: "14", age: "Öğrenci", imageString: "lisaSimpson")
		let homer4 = Simpson(name: "Marge Simpson", job: "32", age: "Ev hanımı", imageString: "margeSimpson")
		let homer5 = Simpson(name: "Abraham Simpson", job: "56", age: "Mühendis", imageString: "abrahamSimpson")
		let homer6 = Simpson(name: "Maggie Simpson", job: "1", age: "Bebek", imageString: "maggieSimpson")
		
		simpsons = [homer1, homer2, homer3, homer4, homer5, homer6]
	}
}

// MARK: Setup
extension CollectionVC{
	private func setupCollectionView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		layout.itemSize = CGSize(width: 185, height: 240)
		myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
		myCollectionView?.register(CollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
		myCollectionView?.backgroundColor = .white
		
		view.addSubview(myCollectionView!)		
	}
}

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return simpsons.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = myCollectionView?.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionCell
		cell.nameLabel.text = simpsons[indexPath.row].name
		cell.jobLabel.text = simpsons[indexPath.row].job
		cell.simpsonImageView.image = UIImage(named: simpsons[indexPath.row].imageString)
		return cell
	}
}
