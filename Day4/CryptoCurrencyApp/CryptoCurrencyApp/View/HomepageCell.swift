//
//  HomepageCell.swift
//  CryptoCurrencyApp
//
//  Created by Yakup on 21.10.2023.
//

import UIKit

class HomepageCell: UICollectionViewCell {
	let currencyLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Arial", size: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.layer.cornerRadius = 40
		label.layer.masksToBounds = true
		label.layer.borderColor = UIColor.systemYellow.cgColor
		label.backgroundColor = .yellow
		label.layer.borderWidth = 5
		return label
	}()
	
	let priceLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Arial", size: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private func addView(){
		backgroundColor = .clear
		addSubview(priceLabel)
		addSubview(currencyLabel)
		
		currencyLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
		currencyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		currencyLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
		currencyLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
		
		priceLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 5).isActive = true
		priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
		priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
		priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}
	
	func setup(indexPath: IndexPath, cryptos: [Crypto]){
		priceLabel.text = cryptos[indexPath.row].price
		currencyLabel.text = cryptos[indexPath.row].currency
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
