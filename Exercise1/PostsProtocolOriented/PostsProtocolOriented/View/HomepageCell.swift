//
//  HomepageCell.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import UIKit

class HomepageCell: UITableViewCell {

	let userIdLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 20)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.layer.borderColor = UIColor.black.cgColor
		label.layer.borderWidth = 1
		label.layer.cornerRadius = 30
		label.layer.masksToBounds = true
		return label
	}()
	let idLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 20)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		return label
	}()
	let titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 22)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		return label
	}()
	let bodyLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 15)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	func setupView(){
		backgroundColor = .clear
		addSubview(idLabel)
		addSubview(userIdLabel)
		addSubview(bodyLabel)
		addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			userIdLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			userIdLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
			userIdLabel.widthAnchor.constraint(equalToConstant: 60),
			userIdLabel.heightAnchor.constraint(equalToConstant: 60),
			
			idLabel.topAnchor.constraint(equalTo: topAnchor),
			idLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			idLabel.widthAnchor.constraint(equalToConstant: 60),
			idLabel.heightAnchor.constraint(equalToConstant: 70),
			
			titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
			titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
			titleLabel.heightAnchor.constraint(equalToConstant: 70),
			titleLabel.widthAnchor.constraint(equalToConstant: 370),
			
			bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			bodyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
			bodyLabel.heightAnchor.constraint(equalToConstant: 60),
			bodyLabel.widthAnchor.constraint(equalToConstant: 370),
		])
	}
	
	func setup(post: Post){
		idLabel.text = String(post.id)
		bodyLabel.text = post.body
		titleLabel.text = post.title
		
		var randomColors = [UIColor.green, UIColor.magenta, UIColor.orange, UIColor.yellow, UIColor.systemPink, UIColor.purple, UIColor.systemIndigo, UIColor.systemMint]
		userIdLabel.backgroundColor = randomColors[post.userID % 8]
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
