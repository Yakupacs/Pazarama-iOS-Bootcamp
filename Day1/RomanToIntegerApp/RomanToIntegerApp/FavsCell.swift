//
//  FavsCell.swift
//  RomanToIntegerApp
//
//  Created by Eken Özlü, Yakup Açış, Beyza Zehra Olgunsoy, Ahmet Yasin Atakan, Şahin Yürek on 14.10.2023.
//

import UIKit
import SnapKit

class FavsCell: UITableViewCell {

    var label =  UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createUI() {
        label = UILabel()
        label.text = "Member Name and Surname"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.4)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
    }

}
