//
//  ViewController.swift
//  StackViews
//
//  Created by Mezut on 23/06/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    
    
    
    var loginTitle: UILabel = {
      var label = UILabel()
        label.text = "Log in"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var facebookbtn: UIButton = {
       let button = UIButton()
        button.setTitle("Log in with Facebook", for: .normal)
        button.backgroundColor = UIColor(red: 65/255, green: 103/255, blue: 178/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var facebookView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var facebookLogo: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "facebook-logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
  
     var optionLabel: UILabel = {
       let label = UILabel()
        label.text = "or"
        label.textColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Email address"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginBtn: UIButton =  {
       let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor( UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var forgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Forget your password?"
        label.textColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        stackView.addArrangedSubview(optionLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginBtn)
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        setupNavbar()
        setupDesign()
        setupViews()
   
        
    }
    
    @objc func buttonClick(){
        print("Button Clicked")
        navigationController?.pushViewController(FindCity(), animated: true)
    }

    
    
    
    func setupNavbar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left-arrow").withRenderingMode(.alwaysOriginal), style: .done, target: nil, action: nil)
        
        // Hides the navigation bar background so it becomes transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    
    }
    
    
    func setupDesign() {
        
        
        view.addSubview(loginTitle)
        view.addSubview(facebookbtn)
        view.addSubview(facebookView)
        view.addSubview(facebookLogo)
    
       
         
        
        view.addSubview(stackView)
        
     view.addSubview(forgotLabel)
     
        
        
    }
    
    
    func setupViews() {
        NSLayoutConstraint.activate([
            
            loginTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            loginTitle.leadingAnchor.constraint(equalTo: facebookbtn.leadingAnchor),
            loginTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
              facebookbtn.topAnchor.constraint(equalTo: loginTitle.safeAreaLayoutGuide.topAnchor, constant: 75),
              facebookbtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
              facebookbtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
              facebookbtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
              facebookbtn.heightAnchor.constraint(equalToConstant: 43),
              
              facebookView.leadingAnchor.constraint(equalTo: facebookbtn.leadingAnchor),
              facebookView.trailingAnchor.constraint(equalTo: facebookbtn.trailingAnchor),
              facebookView.topAnchor.constraint(equalTo: facebookbtn.topAnchor),
              facebookView.heightAnchor.constraint(equalTo: facebookbtn.heightAnchor),
              facebookView.centerYAnchor.constraint(equalTo: facebookbtn.centerYAnchor),
            
              facebookLogo.leadingAnchor.constraint(equalTo: facebookView.leadingAnchor, constant: 63),
              facebookLogo.centerYAnchor.constraint(equalTo: facebookView.centerYAnchor),
              facebookLogo.widthAnchor.constraint(equalToConstant: 20),
              facebookLogo.heightAnchor.constraint(equalToConstant: 20),
              
              stackView.leadingAnchor.constraint(equalTo: facebookbtn.leadingAnchor),
              stackView.trailingAnchor.constraint(equalTo: facebookbtn.trailingAnchor),
              stackView.topAnchor.constraint(equalTo: facebookbtn.bottomAnchor, constant: 0),
              stackView.heightAnchor.constraint(equalToConstant: 220),
              
              forgotLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 15),
              forgotLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
              
            
            
            ])
    
    }

}

