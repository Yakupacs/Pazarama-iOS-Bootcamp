import Foundation

class CepTelefonu {
	
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
class CepTelefonuShared {
	static let shared = CepTelefonuShared(cepTelefonuDatas: [
		CepTelefonu(description: "Apple iPhone 15 128 6 GB RAM 5G (Apple Türkiye Garantili)", normalPrice: "52.999,00 TL", imageName: "telefon1"),
		CepTelefonu(description: "Xiaomi Redmi Note 12 Pro Mavi 256 GB 8 GB Ram Akıllı Telefon (Xiaomi Türkiye Garantili)",discountPrice: "13.999,00 TL", normalPrice: "12.629,00 TL" ,imageName: "telefon2"),
		CepTelefonu(description: "INFINIZ GT10 PRO 8 GB RAM + 8 GB Sanal Ram 256 108MP Cep Telefonu", normalPrice: "18.949,00 TL" ,imageName: "telefon3"),
		CepTelefonu(description: "Samsung Galaxy A14 Gümüş 128 GB 4 GB Ram Akıllı Telefon (Samsung Türkiye Garantili)", normalPrice: "7.199,00 TL" ,imageName: "telefon4"),
		CepTelefonu(description: "Samsung Galaxy S23 Krem 256 GB 8 GB Ram Akıllı Telefon (Samsung Türkiye Garantili)",discountPrice: "34.999,00 TL", normalPrice: "30.189,00 TL" ,imageName: "telefon5"),
		CepTelefonu(description: "Apple iPhone 14 Pro Altın 128 GB 6 GB Ram Akıllı Telefon (Apple Türkiye Garantili)",discountPrice: "67.000,00 TL", normalPrice: "65.675,00 TL" ,imageName: "telefon6"),
		CepTelefonu(description: "Samsung Galaxy A54 5G Beyaz 256 GB 8 GB Ram Akıllı Telefon (Samsung Türkiye Garantili)",discountPrice: "16.250,00 TL", normalPrice: "16.150,00 TL" ,imageName: "telefon7"),
		CepTelefonu(description: "Samsung Galaxy A24 128 GB 6 GB RAM Siyah", normalPrice: "8.349,00 TL" ,imageName: "telefon8"),
		CepTelefonu(description: "Xiaomi Redmi 12C Mor 128 GB 4 GB Ram Akıllı Telefon (Xiaomi Türkiye Garantili)", normalPrice: "5.799,00 TL" ,imageName: "telefon9"),
		CepTelefonu(description: "Vivo V29 Lite 256 GB 8 GB (Vivo Türkiye Garantili) Flare Black", normalPrice: "13.849,00 TL" ,imageName: "telefon10")
		])
	var cepTelefonuDatas: [CepTelefonu]
	private init(cepTelefonuDatas: [CepTelefonu]) {
		self.cepTelefonuDatas = cepTelefonuDatas
	}
}
