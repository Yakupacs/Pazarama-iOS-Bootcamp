//
//  ViewController.swift
//  UnitTests
//
//  Created by Yakup on 28.10.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var todoList = ["Kitap oku", "Yumurta al.", "İngilizce Çalış."]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
	}

	@IBAction func addAction(_ sender: Any) {
		let alert = UIAlertController(title: "To Do Item", message: "Type to To Do Item", preferredStyle: .alert)
		alert.addTextField { textField in
			textField.placeholder = "Todo"
		}
		let okButton = UIAlertAction(title: "Add", style: .default) { action in
			guard let textField = alert.textFields?.first, let inputText = textField.text, !inputText.isEmpty else { return }
			self.todoList.insert(inputText, at: 0)
			self.tableView.insertRows(at: [.SubSequence(row: 0, section: 0)], with: .fade)
		}
		alert.addAction(okButton)
		present(alert, animated: true)
	}
	
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		todoList.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		var content = cell.defaultContentConfiguration()
		content.text = todoList[indexPath.row]
		cell.contentConfiguration = content
		return cell
	}
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete{
			self.todoList.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
}
