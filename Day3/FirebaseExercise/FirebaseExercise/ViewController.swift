//
//  ViewController.swift
//  FirebaseExercise
//
//  Created by Yakup on 20.10.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

	@IBOutlet weak var emailTxtfield: UITextField!
	@IBOutlet weak var passwordTxtfield: UITextField!
	@IBOutlet weak var errorLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	@IBAction func signinActiopn(_ sender: Any) {
		Auth.auth().signIn(withEmail: emailTxtfield.text!, password: passwordTxtfield.text!) { result, error in
			if error != nil{
				self.errorLabel.text = error?.localizedDescription
			}else{
				self.errorLabel.text = "Başarılı!"
			}
		}
	}
	@IBAction func signupAction(_ sender: Any) {
		Auth.auth().createUser(withEmail: emailTxtfield.text!, password: passwordTxtfield.text!){ result, error in
			if error != nil{
				self.errorLabel.text = error?.localizedDescription
			}else{
				self.errorLabel.text = "Başarılı!"
			}
		}
	}
}
