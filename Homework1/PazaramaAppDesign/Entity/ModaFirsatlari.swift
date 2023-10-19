import Foundation

class ModaFirsatlari {
	
	var description: String
	var discountPrice: String?
	var normalPrice: String
	var imageName: String

	init(description: String, discountPrice: String? = nil, normalPrice: String, imageName: String) {
		self.description = description
		self.discountPrice = discountPrice
		self.normalPrice = normalPrice
		self.imageName = imageName
	}
}

// MARK: - Singleton Pattern
class ModaFirsatlariShared {
	static let shared = ModaFirsatlariShared(modaFirsatlariDatas: [
		ModaFirsatlari(description: "Macsylen Su ve Rüzgar Geçirmez İçi Kürklü Mont", discountPrice: "1.200,00 TL", normalPrice: "889.00 TL", imageName: "moda1"),
		ModaFirsatlari(description: "Stil Kombin Renkli Fermuarlı Yağmurluk Mevsimlik PLDP 2920", discountPrice: "748,50 TL", normalPrice: "449.00 TL", imageName: "moda2"),
		ModaFirsatlari(description: "Kadın İçi Astarlı Kapüşonlu Su ve Rüzgar Geçirmez Şişme Kışlık Mont BDM-400", normalPrice: "659.00 TL", imageName: "moda3"),
		ModaFirsatlari(description: "Stil Kombin Düz Büyük Kareli Kışlık Oduncu Gömlek XC 16752A", discountPrice: "328,50 TL", normalPrice: "219,00 TL", imageName: "moda4"),
		ModaFirsatlari(description: "DeFacto Regular Fit Çizgili Bisiklet Yaka Pike Hırka A4881AX23WNRD59", normalPrice: "349.99 TL", imageName: "moda5"),
		ModaFirsatlari(description: "Mero Life Erkek Siyah Kapüşonlu Su ve Rüzgar Geçirmez Softshell Mont", discountPrice: "1.299.00 TL", normalPrice: "899,00 TL", imageName: "moda6"),
		ModaFirsatlari(description: "Erkek Siyah Yeni Sezon Çapraz Fermuarlı Deri Ceket Mont", discountPrice: "999.90 TL", normalPrice: "699,00 TL", imageName: "moda7"),
		ModaFirsatlari(description: "Avva Erkek Siyah Dik Yaka Lightweight Rüzgar Geçirmez Comfort Fit Rahat Kesim Şişme Spor Mont E006000", normalPrice: "1.499.99 TL", imageName: "moda8"),
		ModaFirsatlari(description: "Luc Kaz Tüyü Erkek Mont Siyah", normalPrice: "2.799,99 TL", imageName: "moda9"),
		ModaFirsatlari(description: "Rıders By Lee Gri Erkek Polar Sweatshirt L222717*003 Tam Fermuarlı Polar", discountPrice: "999,00 TL", normalPrice: "349,99 TL", imageName: "moda10"),
	])
	var modaFirsatlariDatas: [ModaFirsatlari]
	private init(modaFirsatlariDatas: [ModaFirsatlari]) {
		self.modaFirsatlariDatas = modaFirsatlariDatas
	}
}
