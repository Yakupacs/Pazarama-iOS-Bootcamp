import Foundation
import UIKit

class CustomCollectionView: UICollectionView {
	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		let myLayout = UICollectionViewFlowLayout()
		myLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 10)
		myLayout.itemSize = CGSize(width: 170, height: 420)
		myLayout.scrollDirection = .horizontal
		
	 	super.init(frame: frame, collectionViewLayout: myLayout)
		setupView()
	}
	
	func setupView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 170, height: 420)
		layout.scrollDirection = .horizontal
		backgroundColor = .white
		showsHorizontalScrollIndicator = false
		showsVerticalScrollIndicator = false
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
