import UIKit

class CustomTabBarController: UITabBarController {

	var firstViewController = HomepageVC()
	var secondViewController = KategorilerVC()
	var thirdViewController = FirsatlarVC()
	var fourthViewController = CuzdanimVC()
	var fifthViewController = HesabimVC()
	
	let selectedColor = UIColor.blue
	let unselectedColor = UIColor.gray
	
    override func viewDidLoad() {
        super.viewDidLoad()
		viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController]
		self.viewControllers = viewControllers
		tabBar.backgroundColor = .white
		setupTabbar()
    }
	func setupTabbar(){
		firstViewController.title = "ANA SAYFA"
		secondViewController.title = "KATEGORİLER"
		thirdViewController.title = "FIRSATLAR"
		fourthViewController.title = "CÜZDANIM"
		fifthViewController.title = "HESABIM"
		
		firstViewController.tabBarItem.image = UIImage(named: "tabbar1")!
		secondViewController.tabBarItem.image = UIImage(named: "tabbar2")!
		thirdViewController.tabBarItem.image = UIImage(named: "tabbar3")!
		fourthViewController.tabBarItem.image = UIImage(named: "tabbar4")!
		fifthViewController.tabBarItem.image = UIImage(named: "tabbar5")!
		
		tabBar.tintColor = selectedColor
		tabBar.unselectedItemTintColor = unselectedColor
		let appearance = UITabBarAppearance()
		
		appearance.stackedLayoutAppearance.selected.iconColor = .blue
		appearance.stackedLayoutAppearance.normal.iconColor = .lightGray
		appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
		appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]

		tabBar.standardAppearance = appearance
		tabBar.scrollEdgeAppearance = appearance
		
		let bottomLine = UIView()
		bottomLine.backgroundColor = UIColor.lightGray
		bottomLine.frame = CGRect(x: 0, y: tabBar.frame.size.height - 50, width: tabBar.frame.width, height: 1)
		tabBar.addSubview(bottomLine)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		tabBar.frame.size.height = 90
		tabBar.frame.origin.y = view.frame.height - 90
	}
}
