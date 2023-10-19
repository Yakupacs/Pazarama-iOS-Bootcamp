import Foundation

class Magaza {
	var imageName: String
	
	init(imageName: String) {
		self.imageName = imageName
	}
}

// MARK: - Singleton Pattern
class magazaDataShared {
	static let shared = magazaDataShared(magazaDatas: [
		Magaza(imageName: "boyner"),
		Magaza(imageName: "defacto"),
		Magaza(imageName: "samsung"),
		Magaza(imageName: "xiaomi"),
		Magaza(imageName: "ebebek"),
		Magaza(imageName: "sutas"),
		Magaza(imageName: "avon"),
		Magaza(imageName: "civil"),
		Magaza(imageName: "aker"),
		Magaza(imageName: "mavi"),
		Magaza(imageName: "derimod")])
	var magazaDatas: [Magaza]
	private init(magazaDatas: [Magaza]) {
		self.magazaDatas = magazaDatas
	}
}
