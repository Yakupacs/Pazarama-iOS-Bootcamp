//
//  ViewController.swift
//  LayoutProject
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class HomeVC: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var simpsons = [Simpson]()
	var selectedSimpson: Simpson?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("viewDidLoad() called.")
		
		tableView.delegate = self
		tableView.dataSource = self
		
		dataUpload()
	}
	override func viewDidAppear(_ animated: Bool) {
		print("viewDidAppear() called.")
	}
	override func viewWillAppear(_ animated: Bool) {
		print("viewWillAppear() called.")
	}
	override func viewDidDisappear(_ animated: Bool) {
		print("viewDidDisappear() called.")
	}
	override func viewWillDisappear(_ animated: Bool) {
		print("viewWillDisappear() called.")
	}
}

// MARK: - TableView
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return simpsons.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		var content = cell.defaultContentConfiguration()
		content.text = simpsons[indexPath.row].name
		content.secondaryText = simpsons[indexPath.row].job
		cell.contentConfiguration = content
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		SelectedSimpson.shared.selected = simpsons[indexPath.row]
		performSegue(withIdentifier: "toDetailsVC", sender: nil)
	}
}

// MARK: - Actions
extension HomeVC{
	func dataUpload(){
		let homer1 = Simpson(name: "Homer Simpson", age: "34", job: "Nükleer", imageString: UIImage(named: "homerSimpson")!)
		let homer2 = Simpson(name: "Bart Simpson", age: "14", job: "Öğrenci", imageString: UIImage(named: "bartSimpson")!)
		let homer3 = Simpson(name: "Lisa Simpson", age: "14", job: "Öğrenci", imageString: UIImage(named: "lisaSimpson")!)
		let homer4 = Simpson(name: "Marge Simpson", age: "32", job: "Ev hanımı", imageString: UIImage(named: "margeSimpson")!)
		
		simpsons = [homer1, homer2, homer3, homer4]
	}
}
