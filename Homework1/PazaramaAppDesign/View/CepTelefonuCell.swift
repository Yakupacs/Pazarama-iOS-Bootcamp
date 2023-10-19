import UIKit

class CepTelefonuCell: UICollectionViewCell {
	let modaImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .clear
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.backgroundColor = .white
		return imageView
	}()
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.textColor = .darkGray
		label.font = UIFont(name: "Arial", size: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let discountLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .lightGray
		label.textAlignment = .center
		label.font = UIFont(name: "Arial", size: 13)
		label.translatesAutoresizingMaskIntoConstraints = false

		let lineView = UIView()
		lineView.backgroundColor = .lightGray
		lineView.translatesAutoresizingMaskIntoConstraints = false
		label.addSubview(lineView)
		lineView.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
		lineView.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
		lineView.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
		lineView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
		
		return label
	}()
	
	let priceLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Arial-DemiBoldMT", size: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private func addView(){
		backgroundColor = .clear
		addSubview(modaImageView)
		addSubview(titleLabel)
		addSubview(discountLabel)
		addSubview(priceLabel)
		
		modaImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		modaImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		modaImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		modaImageView.heightAnchor.constraint(equalToConstant: 270).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: modaImageView.bottomAnchor, constant: 20).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		discountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
		discountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
		discountLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
		
		priceLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 4).isActive = true
		priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
		priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
	}
	
	func setup(indexPath: IndexPath){
		let element = CepTelefonuShared.shared.cepTelefonuDatas[indexPath.row]
		
		modaImageView.image = UIImage(named: element.imageName)
		titleLabel.text = element.description
		priceLabel.text = element.normalPrice
		if let discountPrice = element.discountPrice{
			discountLabel.text = discountPrice
		}
		layer.borderColor = UIColor.systemGray5.cgColor
		layer.borderWidth = 1
		layer.cornerRadius = 3
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

