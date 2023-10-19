import UIKit

class MenuCell: UICollectionViewCell {
    
	let menuImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .clear
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.backgroundColor = .systemGray6
		return imageView
	}()
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.textAlignment = .center
		label.font = UIFont(name: "Arial", size: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private func addView(){
		backgroundColor = .clear
		addSubview(menuImageView)
		addSubview(titleLabel)
		
		menuImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		menuImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		menuImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		menuImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}
	
	func setup(indexPath: IndexPath){
		titleLabel.text = menuDataShared.shared.menuDatas[indexPath.row].title
		menuImageView.image = UIImage(named: menuDataShared.shared.menuDatas[indexPath.row].imageName)
		layer.borderColor = UIColor.systemGray5.cgColor
		layer.borderWidth = 1
		layer.cornerRadius = 10
		layer.masksToBounds = false
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
