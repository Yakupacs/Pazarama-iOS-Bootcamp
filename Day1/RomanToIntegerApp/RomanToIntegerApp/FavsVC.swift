//
//  FavsVC.swift
//  RomanToIntegerApp
//
//  Created by Eken Özlü, Yakup Açış, Beyza Zehra Olgunsoy, Ahmet Yasin Atakan, Şahin Yürek on 14.10.2023.
//

import UIKit
import SnapKit

class FavsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var noDataLabel = UILabel()
    var favTableView = UITableView()
    var favArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let topLabel = UILabel()
        topLabel.text = "Your Favourites"
        topLabel.textColor = .black
        topLabel.font = .systemFont(ofSize: 24, weight: .black)
        topLabel.textAlignment = .center
        view.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(4)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        noDataLabel.text = "You have no favourite conversions"
        noDataLabel.textColor = .darkGray
        noDataLabel.textAlignment = .center
        noDataLabel.numberOfLines = 2
        noDataLabel.isHidden = false
        view.addSubview(noDataLabel)
        noDataLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(4)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        favTableView.dataSource = self
        favTableView.delegate = self
        favTableView.rowHeight = 45
        favTableView.register(FavsCell.self, forCellReuseIdentifier: "favsCell")
        favTableView.isHidden = true
        view.addSubview(favTableView)
        favTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(4)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        getDataFromDefaults()
    }
    
    func getDataFromDefaults() {
        let defaults = UserDefaults.standard
        favArray = defaults.object(forKey: "savedArray") as? [String] ?? [String]()
        if !favArray.isEmpty {
            noDataLabel.isHidden = true
            favTableView.isHidden = false
            favTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favArray.count == 0 {
            favTableView.isHidden = true
            noDataLabel.isHidden = false
        }
        return favArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favsCell", for: indexPath) as! FavsCell
        let conversion = favArray[indexPath.row]
        cell.label.text = conversion
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "DELETE") { _, _, completion in
            //handle deletion
            let defaults = UserDefaults.standard
            self.favArray.remove(at: indexPath.row)
            defaults.set(self.favArray, forKey: "savedArray")
            self.favTableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .red
        action.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
