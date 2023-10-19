import UIKit

class MagazaCell: UICollectionViewCell {
    
	let magazaImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .clear
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.backgroundColor = .white
		return imageView
	}()
	
	private func addView(){
		backgroundColor = .clear
		addSubview(magazaImageView)
		
		magazaImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		magazaImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		magazaImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		magazaImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	func setup(indexPath: IndexPath){
		magazaImageView.image = UIImage(named: magazaDataShared.shared.magazaDatas[indexPath.row].imageName)
		layer.borderColor = UIColor.lightGray.cgColor
		layer.borderWidth = 1
		layer.cornerRadius = 5
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
