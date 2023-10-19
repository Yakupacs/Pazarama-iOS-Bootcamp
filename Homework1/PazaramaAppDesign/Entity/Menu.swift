import Foundation

class Menu {
	var title: String
	var imageName: String
	
	init(title: String, imageName: String) {
		self.title = title
		self.imageName = imageName
	}
}

// MARK: - Singleton Pattern
class menuDataShared {
	static let shared = menuDataShared(menuDatas: [
		Menu(title: "Kategoriler", imageName: "menu1"),
		Menu(title: "Market", imageName: "menu2"),
		Menu(title: "Otel - Tatil\nUçak - Araç", imageName: "menu3"),
		Menu(title: "Pazarama Pet", imageName: "menu4"),
		Menu(title: "Çok Satanlar", imageName: "menu5"),
		Menu(title: "En Favoriler", imageName: "menu6"),
		Menu(title: "Pazarama Puan Kazan", imageName: "menu7"),
		Menu(title: "Hemen Bilet Al", imageName: "menu8"),
		Menu(title: "Fırsatları Kaçırma!", imageName: "menu9"),
		Menu(title: "Baby Turco", imageName: "menu10"),
		Menu(title: "Altınbaş Şıklığı", imageName: "menu11"),
		Menu(title: "SAMSUNG Fırsatları", imageName: "menu12")])
	var menuDatas: [Menu]
	private init(menuDatas: [Menu]) {
		self.menuDatas = menuDatas
	}
}
