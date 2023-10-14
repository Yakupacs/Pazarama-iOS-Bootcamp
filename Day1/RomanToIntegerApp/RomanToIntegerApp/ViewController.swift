//
//  ViewController.swift
//  RomanToIntegerApp
//
//  Created by Eken Özlü, Yakup Açış, Beyza Zehra Olgunsoy, Ahmet Yasin Atakan, Şahin Yürek on 14.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var resultLabel = UILabel()
    var romanNumberTF = UITextField()
    var addFavButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .white
        
        let goToFavsButton = UIButton(type: .system)
        goToFavsButton.setTitle("See Favs >", for: .normal)
        goToFavsButton.setTitleColor(.white, for: .normal)
        goToFavsButton.backgroundColor = .systemGreen
        goToFavsButton.layer.borderColor = UIColor.black.cgColor
        goToFavsButton.layer.borderWidth = 2
        goToFavsButton.layer.cornerRadius = 8
        goToFavsButton.addTarget(self, action: #selector(showFavs(_:)), for: .touchUpInside)
        view.addSubview(goToFavsButton)
        goToFavsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(80)
            make.width.equalToSuperview().multipliedBy(0.25)
            make.height.equalTo(30)
        }
        
        resultLabel.text = "Enter a roman number and tap 'Convert' button, tap 'Add to Favs' button to save your conversion"
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 3
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
        
        romanNumberTF.placeholder = "Enter a Roman Number"
        romanNumberTF.backgroundColor = .gray
        romanNumberTF.textColor = .white
        romanNumberTF.tintColor = .white
        romanNumberTF.borderStyle = .roundedRect
        romanNumberTF.keyboardType = .alphabet
        romanNumberTF.autocapitalizationType = .allCharacters
        view.addSubview(romanNumberTF)
        romanNumberTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resultLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(45)
        }
        
        let convertButton = UIButton(type: .system)
        convertButton.setTitle("CONVERT", for: .normal)
        convertButton.setTitleColor(.black, for: .normal)
        convertButton.backgroundColor = .systemBlue
        convertButton.layer.borderColor = UIColor.black.cgColor
        convertButton.layer.borderWidth = 2
        convertButton.layer.cornerRadius = 8
        convertButton.addTarget(self, action: #selector(convertButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(convertButton)
        convertButton.snp.makeConstraints { make in
            make.leading.equalTo(romanNumberTF.snp.leading)
            make.top.equalTo(romanNumberTF.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(40)
        }
        
        addFavButton = UIButton(type: .system)
        addFavButton.setTitle("Add to Favs", for: .normal)
        addFavButton.setTitleColor(.white, for: .normal)
        addFavButton.backgroundColor = .systemGreen
        addFavButton.layer.borderColor = UIColor.black.cgColor
        addFavButton.layer.borderWidth = 2
        addFavButton.layer.cornerRadius = 8
        addFavButton.isEnabled = false
        addFavButton.alpha = 0.5
        addFavButton.addTarget(self, action: #selector(addFavTapped(_:)), for: .touchUpInside)
        view.addSubview(addFavButton)
        addFavButton.snp.makeConstraints { make in
            make.trailing.equalTo(romanNumberTF.snp.trailing)
            make.top.equalTo(romanNumberTF.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(40)
        }
    }
    
    func showTextFieldAlert(_ message : String) {
        let ac = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func showFavs(_ sender : UIButton) {
        //PRESENT THE NEW VC
        present(FavsVC(), animated: true)
    }
    
    @objc func convertButtonTapped(_ sender : UIButton) {
        if let text = romanNumberTF.text {
            //HANDLE FUNCTION
            do {
                let roma = RomanConversion()
                let resultInt = try roma.convert(text)
                //UPDATE LABEL
                resultLabel.text = "\(text) = \(resultInt)"
                addFavButton.isEnabled = true
                addFavButton.alpha = 1
            }
            catch MyError.runtimeError(let errorMessage) {
                showTextFieldAlert(errorMessage)
            }
            catch {
                showTextFieldAlert("Error")
            }
            
        } else {
            showTextFieldAlert("Please provide a correct format of text")
        }
        
    }
    
    @objc func addFavTapped(_ sender : UIButton) {
        if let text = romanNumberTF.text, !text.isEmpty, let resultText = resultLabel.text, !resultText.isEmpty {
            //HANDLE USER DEFAULTS AND ADD TO FAVS
            let stringToSave = "\(resultText)"
            
            let defaults = UserDefaults.standard
            var savedArray = defaults.object(forKey: "savedArray") as? [String] ?? [String]()
            savedArray.append(stringToSave)
            defaults.set(savedArray, forKey: "savedArray")
            
            resultLabel.text = "Enter a roman number and tap 'Convert' button, tap 'Add to Favs' button to save your conversion"
            romanNumberTF.text = nil
            addFavButton.isEnabled = false
            addFavButton.alpha = 0.5
        } else {
            showTextFieldAlert("Please provide a correct format of text")
        }
    }
    
}

