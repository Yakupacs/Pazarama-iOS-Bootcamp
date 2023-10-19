import Foundation
import UIKit

extension HomepageVC: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if scrollView.contentOffset.y == 0{
			return
		}else if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0{
			UIView.animate(withDuration: 0.3) {
				self.logoImage.frame.origin.y = 60
				self.notificationButton.frame.origin.y = 66
				self.notificationPinkDotView.frame.origin.y = 66
				self.searchBar.frame.origin.y = 110
				self.scrollView.frame.origin.y = 175
			}
		} else {
			UIView.animate(withDuration: 0.3) {
				self.logoImage.frame.origin.y = -100
				self.notificationButton.frame.origin.y = -100
				self.notificationPinkDotView.frame.origin.y = -100
				self.searchBar.frame.origin.y = 60
				self.scrollView.frame.origin.y = 120
			}
		}
	}
}
