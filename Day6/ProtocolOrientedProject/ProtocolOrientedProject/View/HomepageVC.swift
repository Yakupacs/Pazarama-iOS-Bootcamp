//
//  ViewController.swift
//  ProtocolOrientedProject
//
//  Created by Yakup on 28.10.2023.
//

import UIKit

class HomepageVC: UIViewController, UserViewModelOutput {

	private var nameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.font = UIFont(name: "Avenir", size: 23)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
	private var usernameLabel : UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.font = UIFont(name: "Avenir", size: 23)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
	private var emailLabel : UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.font = UIFont(name: "Avenir", size: 23)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
	private var viewModel: UserViewModel
	
	init(viewModel: UserViewModel){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.delegate = self
	}
	
	func updateView(name: String, username: String, email: String) {
		nameLabel.text = name
		usernameLabel.text = username
		emailLabel.text = email
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		viewModel.fetchUsers()
	}

	func setupViews(){
		view.backgroundColor = .lightGray
		view.addSubview(nameLabel)
		view.addSubview(usernameLabel)
		view.addSubview(emailLabel)
		
		NSLayoutConstraint.activate([
			nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
			nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			nameLabel.heightAnchor.constraint(equalToConstant: 40),
			nameLabel.widthAnchor.constraint(equalToConstant: 300),
			
			usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			usernameLabel.heightAnchor.constraint(equalToConstant: 40),
			usernameLabel.widthAnchor.constraint(equalToConstant: 300),
			
			emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
			emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			emailLabel.heightAnchor.constraint(equalToConstant: 40),
			emailLabel.widthAnchor.constraint(equalToConstant: 300)
		])
	}
}

