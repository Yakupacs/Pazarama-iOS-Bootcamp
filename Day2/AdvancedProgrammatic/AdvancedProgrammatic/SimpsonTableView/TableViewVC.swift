//
//  ViewController.swift
//  AdvancedProgrammatic
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class TableViewVC: UIViewController {

	let tableView = UITableView()
	var simpsons = [Simpson]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		tableView.delegate = self
		tableView.dataSource = self
		
		self.navigationItem.title = "Simpsons"
		
		dataUpload()
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

extension TableViewVC: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return simpsons.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
		cell.nameLabel.text = simpsons[indexPath.row].name
		cell.jobLabel.text = simpsons[indexPath.row].job
		cell.simpsonImageView.image = UIImage(named: simpsons[indexPath.row].imageString)
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
}

// MARK: Setup
extension TableViewVC{
	private func setupTableView(){
		tableView.register(CustomCell.self, forCellReuseIdentifier: "customCell")
		
		view.addSubview(tableView)

		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
}
