//
//  ViewController.swift
//  CryptoCurrencyApp
//
//  Created by Yakup on 21.10.2023.
//

import UIKit
import RxSwift

class HomepageVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var collectionView: UICollectionView?
	var cryptoList: [Crypto]?
	let cryptoVM = CryptoViewModel()
	let disposeBag = DisposeBag()
	let activityIndicator = UIActivityIndicatorView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupMenuCollectionView()
		setupBindings()
		cryptoVM.requestData()
	}

	private func setupBindings() {
		_ = cryptoVM
			.cryptos
			.observe(on: MainScheduler.asyncInstance)
			.subscribe(onNext: { data in
				self.cryptoList = data
				self.collectionView?.reloadData()
			}).disposed(by: disposeBag)
		
		_ = cryptoVM
			.error
			.observe(on: MainScheduler.asyncInstance)
			.subscribe(onNext: { errorString in
				
			}).disposed(by: disposeBag)
		
		_ = cryptoVM
			.loading
			.observe(on: MainScheduler.asyncInstance)
			.subscribe(onNext: { bool in
				if bool == true{
					self.activityIndicator.startAnimating()
				}else{
					self.activityIndicator.stopAnimating()
				}
			}).disposed(by: disposeBag)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cryptoList?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomepageCell
		cell.setup(indexPath: indexPath, cryptos: cryptoList ?? [])
		return cell
	}
	
	func setupView(){
		view.addSubview(activityIndicator)
		activityIndicator.hidesWhenStopped = true
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			activityIndicator.heightAnchor.constraint(equalToConstant: 50),
			activityIndicator.widthAnchor.constraint(equalToConstant: 50),
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		let label = UILabel()
		view.addSubview(label)
		label.text = "Currencies"
		label.font = UIFont(name: "Avenir", size: 30)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
			label.leftAnchor.constraint(equalTo: view.leftAnchor),
			label.rightAnchor.constraint(equalTo: view.rightAnchor),
			label.heightAnchor.constraint(equalToConstant: 70)
		])
	}
	
	func setupMenuCollectionView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
		layout.minimumInteritemSpacing = 5
		layout.minimumLineSpacing = 5
		let width = UIScreen.main.bounds.width
		let itemWidth = (width - 50) / 4
		layout.itemSize = CGSize(width: itemWidth, height: 120)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView?.register(HomepageCell.self, forCellWithReuseIdentifier: "cell")
		collectionView?.backgroundColor = .white
		collectionView?.showsHorizontalScrollIndicator = false
		collectionView?.showsVerticalScrollIndicator = false
		
		view.addSubview(collectionView!)
		collectionView?.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView!.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
			collectionView!.leftAnchor.constraint(equalTo: view.leftAnchor),
			collectionView!.rightAnchor.constraint(equalTo: view.rightAnchor),
			collectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		collectionView?.delegate = self
		collectionView?.dataSource = self
	}
}
