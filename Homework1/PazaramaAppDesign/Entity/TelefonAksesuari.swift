import Foundation

class TelefonAksesuari {
	
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
class TelefonAksesuariShared {
	static let shared = TelefonAksesuariShared(telefonAksesuariDatas: [
		TelefonAksesuari(description: "King Power 10.000 Mah Taşınabilir Şarj Cihazı KGP-110", normalPrice: "620.00 TL", imageName: "aksesuar1"),
		TelefonAksesuari(description: "Huaewi FreeBuds SE TWS Beyaz Kulak İçi Bluetooth Kulaklık", normalPrice: "649.00 TL", imageName: "aksesuar2"),
		TelefonAksesuari(description: "Xiaomi Mi Outdoor Bluetooth Mini Hoparlör", normalPrice: "599.00 TL", imageName: "aksesuar3"),
		TelefonAksesuari(description: "Xiaomi Mi Band 7 Akıllı Bileklik Siyah", normalPrice: "849.00 TL", imageName: "aksesuar4"),
		TelefonAksesuari(description: "Oppo Realme TechLife Watch S100 Siyah Akıllı Saat", normalPrice: "1.070.00 TL", imageName: "aksesuar5"),
		TelefonAksesuari(description: "QCY H2 Bluetoothlu Kulaklık Siyah", normalPrice: "579.00 TL", imageName: "aksesuar6"),
		TelefonAksesuari(description: "Apple 5W USB Güç Adaptörü MGN13TU/A", normalPrice: "318.66 TL", imageName: "aksesuar7"),
		TelefonAksesuari(description: "Tecno Buds2 Earphone Siyah", normalPrice: "319.92 TL", imageName: "aksesuar8"),
		TelefonAksesuari(description: "Infinix XE22 TWS Beyaz Bluetooth Kulaklık", normalPrice: "361.77 TL", imageName: "aksesuar9"),
		TelefonAksesuari(description: "Xiaomi Mi Watch 2 Lite Mavi", normalPrice: "1.174.06 TL", imageName: "aksesuar10"),
		TelefonAksesuari(description: "Xiaomi Redmi Watch 3 Active Akıllı Saat", normalPrice: "1.963.66 TL", imageName: "aksesuar11")
		])
	var telefonAksesuariDatas: [TelefonAksesuari]
	private init(telefonAksesuariDatas: [TelefonAksesuari]) {
		self.telefonAksesuariDatas = telefonAksesuariDatas
	}
}
