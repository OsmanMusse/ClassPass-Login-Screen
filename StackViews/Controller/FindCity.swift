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
    
    lazy var addressTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
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
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var nextBtnTopConstraint:  NSLayoutConstraint?
    var locationImgTopConstraint: NSLayoutConstraint?
    var addressTextFieldTopConstraint: NSLayoutConstraint?
    var citylabelDescribTopConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        
//        view.backgroundColor = .blue
        
            NotificationCenter.default.addObserver(self, selector: #selector(FindCity.moveFormUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(FindCity.moveFormDown), name: UIResponder.keyboardWillHideNotification, object: nil)

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
    
    @objc func moveFormUp(_ notification: NSNotification){
        if let info = notification.userInfo, let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let originalRect = keyboardFrame.cgRectValue
            locationImgTopConstraint?.constant = originalRect.height - 485
            addressTextFieldTopConstraint?.constant = 45
            citylabelDescribTopConstraint?.constant = 50
            
            // Hide the left navigation bar in when the keyboard appears
            
            navigationController?.setNavigationBarHidden(true, animated: true)
            
            
            // Hide the next button when the keyboard appears
            
            nextBtn.isHidden = true
            
            
            UIView.animate(withDuration: 0.8){
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func moveFormDown(_ notification: NSNotification) {
       locationImgTopConstraint?.constant = 130
       addressTextFieldTopConstraint?.constant = 40
       citylabelDescribTopConstraint?.constant = 20
        
        
        // Show the navigation bar when the keybaord hides
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Show the next button when the keyboard hides
        
        nextBtn.isHidden = false
        
        
    }

    
    
    
    
    func setupLayout() {
        
        
        // Sets up the layout for the elements that are going to be changed when keyboard appears
        
        nextBtnTopConstraint =  nextBtn.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 10)
        nextBtnTopConstraint?.isActive = true
    
        locationImgTopConstraint = locationImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130)
        locationImgTopConstraint?.isActive = true
        
        addressTextFieldTopConstraint = addressTextField.topAnchor.constraint(equalTo: cityDescribLabel.bottomAnchor, constant: 40)
        
        addressTextFieldTopConstraint?.isActive = true
        
        citylabelDescribTopConstraint = cityDescribLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20)
        
        citylabelDescribTopConstraint?.isActive = true
        
   
        
        NSLayoutConstraint.activate([
             locationImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             locationImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
             
             
             cityLabel.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 10),
             cityLabel.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             cityLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             
             cityDescribLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             cityDescribLabel.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             
             addressTextField.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             addressTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             addressTextField.heightAnchor.constraint(equalToConstant: 46),

             nextBtn.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor),
             nextBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
             nextBtn.heightAnchor.constraint(equalToConstant: 43),
             
             
            
            ])
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}



extension FindCity:  UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
