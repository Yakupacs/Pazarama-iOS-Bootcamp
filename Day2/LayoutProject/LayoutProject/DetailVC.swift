//
//  DetailVC.swift
//  LayoutProject
//
//  Created by Yakup on 15.10.2023.
//

import UIKit

class DetailVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var jobLabel: UILabel!
	@IBOutlet weak var ageLabel: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

		var simpson = SelectedSimpson.shared.selected

		nameLabel.text = simpson?.name
		jobLabel.text = simpson?.job
		ageLabel.text = simpson?.age
		imageView.image = simpson?.imageString
    }
}
