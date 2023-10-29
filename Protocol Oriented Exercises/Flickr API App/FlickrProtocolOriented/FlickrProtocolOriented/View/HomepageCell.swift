//
//  HomepageCell.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import UIKit
import SDWebImage

class HomepageCell: UITableViewCell {

	private let photoImageView: UIImageView = {
		var imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let usernameTitle: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .gray
		label.minimumScaleFactor = 0.5
		return label
	}()
	
	private let photoTitle: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 20)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.minimumScaleFactor = 0.5
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func addView(){
		backgroundColor = .clear
		addSubview(photoImageView)
		addSubview(photoTitle)
		addSubview(usernameTitle)
		
		NSLayoutConstraint.activate([
			photoImageView.topAnchor.constraint(equalTo: topAnchor),
			photoImageView.leftAnchor.constraint(equalTo: leftAnchor),
			photoImageView.rightAnchor.constraint(equalTo: rightAnchor),
			photoImageView.heightAnchor.constraint(equalToConstant: 250),
			
			usernameTitle.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
			usernameTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
			usernameTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			usernameTitle.heightAnchor.constraint(equalToConstant: 40),
			
			photoTitle.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor),
			photoTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			photoTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			photoTitle.heightAnchor.constraint(equalToConstant: 40),
		])
	}
	
	func setup(photo: Photo){
		photoTitle.text = photo.title
		usernameTitle.text = "@" + photo.ownername
		if let urlZ = photo.urlZ{
			photoImageView.sd_setImage(with: URL(string: urlZ)!)
		}else if let urlN = photo.urlN{
			photoImageView.sd_setImage(with: URL(string: urlN)!)
		}
	}
}
