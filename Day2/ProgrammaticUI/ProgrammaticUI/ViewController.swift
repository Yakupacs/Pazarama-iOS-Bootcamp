//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let width = view.frame.size.width
		let height = view.frame.size.height
		
		let myLabel = UILabel(frame: CGRect(x: width / 2 - 150, y: height / 2 - 150, width: 300, height: 100))
		myLabel.text = "Hello World!"
		myLabel.font = UIFont(name: "Menlo", size: 30)
		myLabel.textAlignment = .center
		myLabel.textColor = .black
		myLabel.numberOfLines = 0
		view.addSubview(myLabel)
		
		let myButton = UIButton(frame: CGRect(x: width / 2 - 75, y: height / 2, width: 150, height: 40))
		myButton.setTitle("Okey", for: .normal)
		myButton.backgroundColor = .white
		myButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
		myButton.setTitleColor(.black, for: .normal)
		myButton.layer.cornerRadius = 5
		myButton.layer.borderWidth = 1
		myButton.layer.borderColor = UIColor.black.cgColor
		view.addSubview(myButton)
	}

	@objc func buttonTap(){
		print("Clicked.")
	}
}

