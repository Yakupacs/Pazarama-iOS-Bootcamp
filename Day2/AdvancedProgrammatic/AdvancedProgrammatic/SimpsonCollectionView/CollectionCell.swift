//
//  CollectionCell.swift
//  AdvancedProgrammatic
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
	
	let simpsonImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .clear
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Menlo", size: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let jobLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Menlo", size: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private func addView(){
		backgroundColor = .clear
		addSubview(simpsonImageView)
		addSubview(nameLabel)
		addSubview(jobLabel)
		
		simpsonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
		simpsonImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
		simpsonImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
		simpsonImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		
		nameLabel.topAnchor.constraint(equalTo: simpsonImageView.bottomAnchor, constant: 10).isActive = true
		nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		
		jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
		jobLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		jobLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
