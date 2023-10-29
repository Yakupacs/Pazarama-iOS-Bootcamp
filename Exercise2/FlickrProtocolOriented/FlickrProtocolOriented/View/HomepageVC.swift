//
//  ViewController.swift
//  FlickrProtocolOriented
//
//  Created by Yakup on 29.10.2023.
//

import UIKit

class HomepageVC: UIViewController, PhotoViewModelOutput {

	var photoViewModel: PhotoViewModel?
	var tableView = UITableView()
	
	var photos = [Photo]()
	
	init(photoViewModel: PhotoViewModel? = nil) {
		self.photoViewModel = photoViewModel
		super.init(nibName: nil, bundle: nil)
		photoViewModel?.requestPhotos()
		photoViewModel?.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		setupTableView()
	}

	func viewUpdate(photos: [Photo]) {
		DispatchQueue.main.async {
			self.photos = photos
			self.tableView.reloadData()
		}
	}
	
	func setupTableView(){
		let label = UILabel()
		label.font = UIFont(name: "Avenir", size: 25)
		label.text = "Flickr Photo App"
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			label.leftAnchor.constraint(equalTo: view.leftAnchor),
			label.rightAnchor.constraint(equalTo: view.rightAnchor),
			label.heightAnchor.constraint(equalToConstant: 50)
		])
		
		view.addSubview(tableView)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		tableView.register(HomepageCell.self, forCellReuseIdentifier: "cell")
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: label.bottomAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
		])
	}
}

extension HomepageVC: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return photos.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomepageCell
		cell.setup(photo: photos[indexPath.row])
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 350
	}
}
