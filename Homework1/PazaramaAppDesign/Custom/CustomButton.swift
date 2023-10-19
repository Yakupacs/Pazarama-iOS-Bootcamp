import Foundation
import UIKit

class CustomButton: UIButton {
	init(frame: CGRect, image: UIImage, cornerRadius: CGFloat) {
		super.init(frame: frame)
		commonInit(image: image, cornerRadius: cornerRadius)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func commonInit(image: UIImage, cornerRadius: CGFloat) {
		setImage(image, for: .normal)
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = cornerRadius
		layer.masksToBounds = true
	}
}
