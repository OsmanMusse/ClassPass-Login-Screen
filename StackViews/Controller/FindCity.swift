//
//  FindCity.swift
//  StackViews
//
//  Created by Mezut on 27/06/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import  UIKit

class FindCity: UIViewController {
    
    
    let locationImage: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "location"))
        image.clipsToBounds = true
        image.contentMode = .left
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let cityLabel: UILabel = {
       let label = UILabel()
        label.text = "Find your city"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityDescribLabel: UILabel = {
        let label = UILabel()
        label.text = "We need your location to show you the best studios and classes around you."
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 69/255, green: 71/255, blue: 69/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Address or city"
        textField.attributedPlaceholder = NSAttributedString(string: "Address or city", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(red: 209/255, green: 209/255, blue: 213/255, alpha: 1)])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nextBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        
//        view.backgroundColor = .blue
        
        view.addSubview(locationImage)
        view.addSubview(cityLabel)
        view.addSubview(cityDescribLabel)
        view.addSubview(addressTextField)
        view.addSubview(nextBtn)
        
        setupNavigation()
        setupLayout()
        
    }
    
    
    
    func setupNavigation(){

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left-arrow").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(gobackBtn))
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    
    @objc func gobackBtn(){
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupLayout() {
        NSLayoutConstraint.activate([
             locationImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             locationImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
             locationImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
             
             cityLabel.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 10),
             cityLabel.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             cityLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             
             cityDescribLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
             cityDescribLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             cityDescribLabel.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             
             addressTextField.topAnchor.constraint(equalTo: cityDescribLabel.bottomAnchor, constant: 40),
             addressTextField.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             addressTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             addressTextField.heightAnchor.constraint(equalToConstant: 46),
             
             nextBtn.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 15),
             nextBtn.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             nextBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             nextBtn.heightAnchor.constraint(equalToConstant: 43)
             
            
            ])
    }
    
}
