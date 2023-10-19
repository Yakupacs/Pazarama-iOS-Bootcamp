import Foundation
import UIKit

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView {
		case menuCollectionView:
			return menuDataShared.shared.menuDatas.count
		case magazalarCollectionView:
			return magazaDataShared.shared.magazaDatas.count
		case modaFirsatlariCollectionView:
			return ModaFirsatlariShared.shared.modaFirsatlariDatas.count
		case cepTelefonuCollectionView:
			return CepTelefonuShared.shared.cepTelefonuDatas.count
		case telefonAksesuariCollectionView:
			return TelefonAksesuariShared.shared.telefonAksesuariDatas.count
		default:
			return 0
		}
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView {
		case menuCollectionView:
			let cell = menuCollectionView?.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
			cell.setup(indexPath: indexPath)
			return cell
		case magazalarCollectionView:
			let cell = magazalarCollectionView?.dequeueReusableCell(withReuseIdentifier: "magazaCell", for: indexPath) as! MagazaCell
			cell.setup(indexPath: indexPath)
			return cell
		case modaFirsatlariCollectionView:
			let cell = modaFirsatlariCollectionView?.dequeueReusableCell(withReuseIdentifier: "modaCell", for: indexPath) as! ModaFirsatlariCell
			cell.setup(indexPath: indexPath)
			return cell
		case cepTelefonuCollectionView:
			let cell = cepTelefonuCollectionView?.dequeueReusableCell(withReuseIdentifier: "cepTelefonuCell", for: indexPath) as! CepTelefonuCell
			cell.setup(indexPath: indexPath)
			return cell
		case telefonAksesuariCollectionView:
			let cell = telefonAksesuariCollectionView?.dequeueReusableCell(withReuseIdentifier: "aksesuarCell", for: indexPath) as! TelefonAksesuariCell
			cell.setup(indexPath: indexPath)
			return cell
		default:
			return UICollectionViewCell()
		}
	}
}

extension HomepageVC{
	// MARK: - Setup Menu CollectionView
	func setupMenuCollectionView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
		layout.minimumInteritemSpacing = 5
		layout.minimumLineSpacing = 5
		let width = UIScreen.main.bounds.width
		let itemWidth = (width - 50) / 4
		layout.itemSize = CGSize(width: itemWidth, height: 110)
		
		menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		menuCollectionView?.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
		menuCollectionView?.backgroundColor = .white
		menuCollectionView?.showsHorizontalScrollIndicator = false
		menuCollectionView?.showsVerticalScrollIndicator = false
		
		contentView.addSubview(menuCollectionView!)
		menuCollectionView?.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			menuCollectionView!.topAnchor.constraint(equalTo: contentView.topAnchor),
			menuCollectionView!.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
			menuCollectionView!.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
			menuCollectionView!.heightAnchor.constraint(equalToConstant: 340)
		])
		menuCollectionView?.delegate = self
		menuCollectionView?.dataSource = self
	}
	
	// MARK: - Setup Magaza CollectionView
	func setupMagazaCollectionView(){
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 120, height: 80)
		layout.scrollDirection = .horizontal
		magazalarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		magazalarCollectionView?.register(MagazaCell.self, forCellWithReuseIdentifier: "magazaCell")
		magazalarCollectionView?.backgroundColor = .white
		magazalarCollectionView?.showsHorizontalScrollIndicator = false
		magazalarCollectionView?.showsVerticalScrollIndicator = false
		
		contentView.addSubview(magazalarCollectionView!)
		magazalarCollectionView?.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			magazalarCollectionView!.topAnchor.constraint(equalTo: populerMagazalarLabel.bottomAnchor),
			magazalarCollectionView!.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			magazalarCollectionView!.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			magazalarCollectionView!.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			magazalarCollectionView!.heightAnchor.constraint(equalToConstant: 100)
		])
		magazalarCollectionView?.delegate = self
		magazalarCollectionView?.dataSource = self
	}
	
	// MARK: - Setup ModaFirsatlari CollectionView
	func setupModaFirsatlariCollectionView(){
		modaFirsatlariCollectionView = CustomCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
		modaFirsatlariCollectionView?.register(ModaFirsatlariCell.self, forCellWithReuseIdentifier: "modaCell")
		contentView.addSubview(modaFirsatlariCollectionView!)
		NSLayoutConstraint.activate([
			modaFirsatlariCollectionView!.topAnchor.constraint(equalTo: modaFirsatlariLabel.bottomAnchor, constant: 10),
			modaFirsatlariCollectionView!.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
			modaFirsatlariCollectionView!.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			modaFirsatlariCollectionView!.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			modaFirsatlariCollectionView!.heightAnchor.constraint(equalToConstant: 420)
		])
		modaFirsatlariCollectionView?.delegate = self
		modaFirsatlariCollectionView?.dataSource = self
	}
	
	// MARK: - Setup CepTelefonu CollectionView
	func setupCepTelefonuCollectionView(){
		cepTelefonuCollectionView = CustomCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
		cepTelefonuCollectionView?.register(CepTelefonuCell.self, forCellWithReuseIdentifier: "cepTelefonuCell")
		contentView.addSubview(cepTelefonuCollectionView!)
		NSLayoutConstraint.activate([
			cepTelefonuCollectionView!.topAnchor.constraint(equalTo: cepTelefonlariLabel.bottomAnchor, constant: 10),
			cepTelefonuCollectionView!.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
			cepTelefonuCollectionView!.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			cepTelefonuCollectionView!.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			cepTelefonuCollectionView!.heightAnchor.constraint(equalToConstant: 420)
		])
		cepTelefonuCollectionView?.delegate = self
		cepTelefonuCollectionView?.dataSource = self
	}
	
	// MARK: - Setup TelefonAksesuari CollectionView
	func setupTelefonAksesuariCollectionView(){
		telefonAksesuariCollectionView = CustomCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
		telefonAksesuariCollectionView!.register(TelefonAksesuariCell.self, forCellWithReuseIdentifier: "aksesuarCell")
		contentView.addSubview(telefonAksesuariCollectionView!)
		NSLayoutConstraint.activate([
			telefonAksesuariCollectionView!.topAnchor.constraint(equalTo: telefonAksesuarlariLabel.bottomAnchor, constant: 10),
			telefonAksesuariCollectionView!.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
			telefonAksesuariCollectionView!.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			telefonAksesuariCollectionView!.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			telefonAksesuariCollectionView!.heightAnchor.constraint(equalToConstant: 420)
		])
		telefonAksesuariCollectionView?.delegate = self
		telefonAksesuariCollectionView?.dataSource = self
	}
}
