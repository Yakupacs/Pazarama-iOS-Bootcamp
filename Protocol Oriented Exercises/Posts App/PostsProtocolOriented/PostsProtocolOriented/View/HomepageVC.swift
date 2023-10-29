//
//  ViewController.swift
//  PostsProtocolOriented
//
//  Created by Yakup on 28.10.2023.
//

import UIKit

class HomepageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, PostViewModelOutput {

	let tableView = UITableView()
	var postViewModel: PostViewModel
	
	var posts = [Post]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .red
		setupTableView()
	}

	init(postViewModel: PostViewModel) {
		self.postViewModel = postViewModel
		postViewModel.fetchPosts()
		super.init(nibName: nil, bundle: nil)
		self.postViewModel.output = self
	}
	
	func updateView(post: [Post]) {
		DispatchQueue.main.async{
			self.posts = post
			self.tableView.reloadData()
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupTableView(){
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(HomepageCell.self, forCellReuseIdentifier: "cell")
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
		])
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomepageCell
		cell.setup(post: posts[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
}

