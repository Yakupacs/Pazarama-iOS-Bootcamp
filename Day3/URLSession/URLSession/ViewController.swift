//
//  ViewController.swift
//  URLSession
//
//  Created by Yakup on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label1: UILabel!
	@IBOutlet weak var label2: UILabel!
	@IBOutlet weak var label3: UILabel!
	@IBOutlet weak var label4: UILabel!
	@IBOutlet weak var label5: UILabel!
	@IBOutlet weak var loadButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	@IBAction func loadData(_ sender: Any) {
		let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
		
		URLSession.shared.dataTask(with: url!) { data, response, error in
			if error != nil{
				let okey = UIAlertAction(title: "Okey", style: .default)
				let alert = UIAlertController(title: "Warning", message: error!.localizedDescription, preferredStyle: .alert)
				alert.addAction(okey)
				self.present(alert, animated: true)
			}else{
				if data != nil{
					do {
						let jsonResponse = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
						if let rates = jsonResponse["rates"] as? [String: Any]{
							DispatchQueue.main.async {
								if let jpy = rates["JPY"] as? Double{
									self.label1.text = "JPY: \(jpy)"
								}
								if let cad = rates["CAD"] as? Double{
									self.label2.text = "CAD: \(cad)"
								}
								if let chf = rates["CHF"] as? Double{
									self.label3.text = "CHF: \(chf)"
								}
								if let usd = rates["USD"] as? Double{
									self.label4.text = "USD: \(usd)"
								}
								if let turkish = rates["TRY"] as? Double{
									self.label5.text = "TRY: \(turkish)"
								}
							}
						}
					} catch {
						let okey = UIAlertAction(title: "Okey", style: .default)
						let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
						alert.addAction(okey)
						self.present(alert, animated: true)
					}
				}
			}
		}.resume()
	}
	
}

