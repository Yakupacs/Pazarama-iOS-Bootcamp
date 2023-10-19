import UIKit

class HomepageVC: UIViewController {
	let scrollViewHeight : CGFloat = 5400
	
	var menuCollectionView: UICollectionView?
	var magazalarCollectionView: UICollectionView?
	var modaFirsatlariCollectionView: UICollectionView?
	var cepTelefonuCollectionView: UICollectionView?
	var telefonAksesuariCollectionView: UICollectionView?
	
	let logoImage = UIImageView()
	let scrollView = UIScrollView()
	let searchBar = UISearchBar()
	let contentView = UIView()
	let populerMagazalarLabel = UILabel()
	let modaFirsatlariLabel = UILabel()
	let cepTelefonlariLabel = UILabel()
	let telefonAksesuarlariLabel = UILabel()
	let notificationButton = CustomButton(frame: .zero, image: UIImage(named: "bell")!, cornerRadius: 0)
	var notificationPinkDotView = UIView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupMenuCollectionView()
		setupMagazaCollectionView()
		setupModaFirsatlariCollectionView()
		setupCepTelefonuCollectionView()
		setupTelefonAksesuariCollectionView()
	}
}

// MARK: - VIEW SETUP

extension HomepageVC{
	private func setupView(){
		scrollView.delegate = self
		view.backgroundColor = .white
		
		// MARK: - Logo UIImageView()
		view.addSubview(logoImage)
		logoImage.image = UIImage(named: "pazaramaLogo")
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		logoImage.contentMode = .scaleAspectFill
		
		NSLayoutConstraint.activate([
			logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
			logoImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
			logoImage.heightAnchor.constraint(equalToConstant: 40),
			logoImage.widthAnchor.constraint(equalToConstant: 150)
		])
		
		// MARK: - Bildirim UIButton()
		view.addSubview(notificationButton)
		NSLayoutConstraint.activate([
			notificationButton.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
			notificationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			notificationButton.heightAnchor.constraint(equalToConstant: 28),
			notificationButton.widthAnchor.constraint(equalToConstant: 28)
		])
		
		notificationPinkDotView.layer.cornerRadius = 7
		notificationPinkDotView.backgroundColor = .systemPink
		notificationPinkDotView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(notificationPinkDotView)
		NSLayoutConstraint.activate([
			notificationPinkDotView.heightAnchor.constraint(equalToConstant: 14),
			notificationPinkDotView.widthAnchor.constraint(equalToConstant: 14),
			notificationPinkDotView.topAnchor.constraint(equalTo: notificationButton.topAnchor),
			notificationPinkDotView.rightAnchor.constraint(equalTo: notificationButton.rightAnchor)
		])
		
		// MARK: - SearchBar
		view.addSubview(searchBar)
		searchBar.placeholder = " Marka, ürün veya hizmet arayın"
		searchBar.searchBarStyle = .minimal
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.searchTextField.leftView?.tintColor = .black
		searchBar.searchTextField.backgroundColor = .white
		searchBar.searchTextField.font = UIFont(name: "Arial", size: 15)
		if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
			searchTextField.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				searchTextField.heightAnchor.constraint(equalToConstant: 50),
				searchTextField.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 10),
				searchTextField.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -10),
				searchTextField.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor, constant: 0)
			])
			searchTextField.clipsToBounds = true
			searchTextField.layer.cornerRadius = 10.0
			searchTextField.layer.borderColor = UIColor.systemGray4.cgColor
			searchTextField.layer.borderWidth = 1
		}
		
		NSLayoutConstraint.activate([
			searchBar.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
			searchBar.rightAnchor.constraint(equalTo: view.rightAnchor),
			searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
		])
		
		let cameraButton = CustomButton(frame: .zero, image: UIImage(named: "camera")!, cornerRadius: 0)
		searchBar.addSubview(cameraButton)
		NSLayoutConstraint.activate([
			cameraButton.rightAnchor.constraint(equalTo: searchBar.rightAnchor, constant: -25),
			cameraButton.heightAnchor.constraint(equalToConstant: 20),
			cameraButton.widthAnchor.constraint(equalToConstant: 22),
			cameraButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor)
		])
		
		// MARK: - ScrollView
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.delegate = self
 		view.addSubview(scrollView)
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
			scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
			scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
		
		
		contentView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.addSubview(contentView)
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
			contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			contentView.heightAnchor.constraint(equalToConstant: scrollViewHeight)
		])
		
		// MARK: - Pazarama Puanlarım UIButton
		let pazaramaPuanlarimButton = CustomButton(frame: .zero, image: UIImage(named: "pazaramaPuanlarim")!, cornerRadius: 5)
		contentView.addSubview(pazaramaPuanlarimButton)
		NSLayoutConstraint.activate([
			pazaramaPuanlarimButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 358),
			pazaramaPuanlarimButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			pazaramaPuanlarimButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			pazaramaPuanlarimButton.heightAnchor.constraint(equalToConstant: 40),
		])
		
		// MARK: - Türkiye İş Bankası Kuruluşudur ImageView
		let turkiyeIsBankasiImageView = UIImageView()
		contentView.addSubview(turkiyeIsBankasiImageView)
		turkiyeIsBankasiImageView.image = UIImage(named: "turkiyeIsBankasi")
		turkiyeIsBankasiImageView.translatesAutoresizingMaskIntoConstraints = false
		turkiyeIsBankasiImageView.contentMode = .scaleAspectFit
		NSLayoutConstraint.activate([
			turkiyeIsBankasiImageView.topAnchor.constraint(equalTo: pazaramaPuanlarimButton.bottomAnchor, constant: 5),
			turkiyeIsBankasiImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
			turkiyeIsBankasiImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
			turkiyeIsBankasiImageView.heightAnchor.constraint(equalToConstant: 50),
		])
		
		// MARK: - Ekimin Süperi UIButton
		let ekiminSuperButton = CustomButton(frame: .zero, image: UIImage(named: "ekiminSuperi")!, cornerRadius: 5)
		contentView.addSubview(ekiminSuperButton)
		NSLayoutConstraint.activate([
			ekiminSuperButton.topAnchor.constraint(equalTo: turkiyeIsBankasiImageView.bottomAnchor, constant: 5),
			ekiminSuperButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			ekiminSuperButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			ekiminSuperButton.heightAnchor.constraint(equalToConstant: 210),
		])
		
		// MARK: - Popüler Mağazalar UILabel
		contentView.addSubview(populerMagazalarLabel)
		populerMagazalarLabel.translatesAutoresizingMaskIntoConstraints = false
		populerMagazalarLabel.text = "Popüler Mağazalar"
		populerMagazalarLabel.font = UIFont(name: "Palatino", size: 20)
		populerMagazalarLabel.textColor = .black
		NSLayoutConstraint.activate([
			populerMagazalarLabel.topAnchor.constraint(equalTo: ekiminSuperButton.bottomAnchor, constant: 20),
			populerMagazalarLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			populerMagazalarLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
		])
		
		// MARK: - Moda Fırsatları UILabel
		contentView.addSubview(modaFirsatlariLabel)
		modaFirsatlariLabel.translatesAutoresizingMaskIntoConstraints = false
		modaFirsatlariLabel.text = "Moda Fırsatları"
		modaFirsatlariLabel.font = UIFont(name: "Palatino", size: 20)
		modaFirsatlariLabel.textColor = .black
		NSLayoutConstraint.activate([
			modaFirsatlariLabel.topAnchor.constraint(equalTo: populerMagazalarLabel.bottomAnchor, constant: 120),
			modaFirsatlariLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			modaFirsatlariLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
		])
		
		// MARK: - Kampanya1 UIButton
		let kampanya1 = CustomButton(frame: .zero, image: UIImage(named: "kampanya1")!, cornerRadius: 10)
		contentView.addSubview(kampanya1)
		NSLayoutConstraint.activate([
			kampanya1.topAnchor.constraint(equalTo: modaFirsatlariLabel.bottomAnchor, constant: 450),
			kampanya1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			kampanya1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			kampanya1.heightAnchor.constraint(equalToConstant: 210),
		])
		
		// MARK: - Kampanya2 UIButton
		let kampanya2 = createKampanya(image: UIImage(named: "kampanya2")!, y: kampanya1.bottomAnchor)
		
		// MARK: - Kampanya3 UIButton
		let kampanya3 = createKampanya(image: UIImage(named: "kampanya3")!, y: kampanya2.bottomAnchor)
		
		// MARK: - Kampanya4 UIButton
		let kampanya4 = createKampanya(image: UIImage(named: "kampanya4")!, y: kampanya3.bottomAnchor)
		
		// MARK: - Kampanya5 UIButton
		let kampanya5 = createKampanya(image: UIImage(named: "kampanya5")!, y: kampanya4.bottomAnchor)
		
		// MARK: - Kampanya6 UIButton
		let kampanya6 = createKampanya(image: UIImage(named: "kampanya6")!, y: kampanya5.bottomAnchor)
		
		// MARK: - Kampanya7 UIButton
		let kampanya7 = createKampanya(image: UIImage(named: "kampanya7")!, y: kampanya6.bottomAnchor)
		
		// MARK: - Kampanya8 UIButton
		let kampanya8 = createKampanya(image: UIImage(named: "kampanya8")!, y: kampanya7.bottomAnchor)
		
		// MARK: - Cep Telefonları UILabel
		contentView.addSubview(cepTelefonlariLabel)
		cepTelefonlariLabel.translatesAutoresizingMaskIntoConstraints = false
		cepTelefonlariLabel.text = "Cep Telefonu Fırsatları"
		cepTelefonlariLabel.font = UIFont(name: "Palatino", size: 20)
		cepTelefonlariLabel.textColor = .black
		NSLayoutConstraint.activate([
			cepTelefonlariLabel.topAnchor.constraint(equalTo: kampanya8.bottomAnchor, constant: 20),
			cepTelefonlariLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			cepTelefonlariLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
		])
		
		// MARK: - Kampanya9 UIButton
		let kampanya9 = CustomButton(frame: .zero, image: UIImage(named: "kampanya9")!, cornerRadius: 10)
		contentView.addSubview(kampanya9)
		NSLayoutConstraint.activate([
			kampanya9.topAnchor.constraint(equalTo: cepTelefonlariLabel.bottomAnchor, constant: 450),
			kampanya9.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			kampanya9.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			kampanya9.heightAnchor.constraint(equalToConstant: 210),
		])
		
		// MARK: - Kampanya10 UIButton
		let kampanya10 = createKampanya(image: UIImage(named: "kampanya10")!, y: kampanya9.bottomAnchor)
		
		// MARK: - Kampanya11 UIButton
		let kampanya11 = createKampanya(image: UIImage(named: "kampanya11")!, y: kampanya10.bottomAnchor)
		
		// MARK: - Telefon Aksesuarları UILabel
		contentView.addSubview(telefonAksesuarlariLabel)
		telefonAksesuarlariLabel.translatesAutoresizingMaskIntoConstraints = false
		telefonAksesuarlariLabel.text = "Telefon Aksesuarları"
		telefonAksesuarlariLabel.font = UIFont(name: "Palatino", size: 20)
		telefonAksesuarlariLabel.textColor = .black
		NSLayoutConstraint.activate([
			telefonAksesuarlariLabel.topAnchor.constraint(equalTo: kampanya11.bottomAnchor, constant: 20),
			telefonAksesuarlariLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			telefonAksesuarlariLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
		])
		
		// MARK: - Kampanya12 UIButton
		let kampanya12 = CustomButton(frame: .zero, image: UIImage(named: "kampanya12")!, cornerRadius: 10)
		contentView.addSubview(kampanya12)
		NSLayoutConstraint.activate([
			kampanya12.topAnchor.constraint(equalTo: telefonAksesuarlariLabel.bottomAnchor, constant: 450),
			kampanya12.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			kampanya12.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			kampanya12.heightAnchor.constraint(equalToConstant: 210),
		])
		
		// MARK: - Kampanya13 UIButton
		let kampanya13 = createKampanya(image: UIImage(named: "kampanya13")!, y: kampanya12.bottomAnchor)
		
		// MARK: - Kampanya14 UIButton
		let _ = createKampanya(image: UIImage(named: "kampanya14")!, y: kampanya13.bottomAnchor)
	}
	
	private func createKampanya(image: UIImage, y: NSLayoutYAxisAnchor) -> CustomButton{
		let kampanya = CustomButton(frame: .zero, image: image, cornerRadius: 10)
		contentView.addSubview(kampanya)
		NSLayoutConstraint.activate([
			kampanya.topAnchor.constraint(equalTo: y, constant: 10),
			kampanya.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			kampanya.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			kampanya.heightAnchor.constraint(equalToConstant: 210),
		])
		return kampanya
	}
}
