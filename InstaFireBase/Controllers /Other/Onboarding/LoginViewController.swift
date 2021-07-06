//
//  LoginViewController.swift
//  InstaFireBase
//
//  Created by A.M on 6/22/21.
//

import UIKit
import SafariServices
//import FirebaseAuth

class LoginViewController: UIViewController , UITextFieldDelegate{
    
    struct Constants {
        static let cornerRadious:CGFloat = 8.0
        
    }
    
    
    private let  userNameEmailTextField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadious
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let  passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadious
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let  loginBtn: UIButton = {
       let button = UIButton()
        button.setTitle("LogIn", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadious
        button.backgroundColor = #colorLiteral(red: 0.1885291771, green: 0.2584495942, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let  termsBtn: UIButton = {
        let button = UIButton()
         button.setTitle("Terms of Service", for: .normal)
         button.layer.masksToBounds = true
 //        button.layer.cornerRadius = Constants.cornerRadious
        button.setTitleColor(.lightGray, for: .normal)
         return button
    }()
    
    private let  privacyBtn: UIButton = {
        let button = UIButton()
         button.setTitle("Policy of Service ", for: .normal)
         button.layer.masksToBounds = true
 //    button.layer.cornerRadius = Constants.cornerRadious
        button.setTitleColor(.lightGray, for: .normal)
         return button
    }()
    

    
    private let createAccountBtn: UIButton = {
        
        let button = UIButton()
        button.setTitle("New User? Create Account ", for: .normal)
        button.layer.masksToBounds = true
       button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    
    
    private let  headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
       // header.backgroundColor = .lightGray
        let backgroundImageView = UIImageView(image: UIImage(named: "instaColor"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameEmailTextField.delegate = self
        passwordTextField.delegate = self
    
        loginBtn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
        createAccountBtn.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        termsBtn.addTarget(self, action: #selector(didTaptermsBtn), for: .touchUpInside)
        privacyBtn.addTarget(self, action: #selector(didTapprivacyBtn), for: .touchUpInside)
        addSubViews()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0.0 , width: view.width, height: view.hight/3.0)
        
        userNameEmailTextField.frame = CGRect(x: 25.0 , y: headerView.bottom + 30.0 , width: view.width-50, height:52.0)
        
        passwordTextField.frame = CGRect(x: 25.0, y: userNameEmailTextField.bottom + 10 , width: view.width - 50, height: 52.0)
        loginBtn.frame = CGRect(x: 25.0, y: passwordTextField.bottom + 10, width: view.width - 50, height: 52.0)
    createAccountBtn.frame = CGRect(x: 10, y: loginBtn.bottom + 10 , width: view.width - 20 , height: 25)
        
        termsBtn.frame = CGRect(x: 10, y: view.hight - view.safeAreaInsets.bottom - 100 , width: view.width - 20 , height: 25)
        privacyBtn.frame = CGRect(x: 10, y: view.hight - view.safeAreaInsets.bottom - 50 , width: view.width - 20 , height: 25)

            configurHeaderView()
        }
    
    
    private func configurHeaderView(){
        
        guard headerView.subviews.count == 1 else{
            return
        }
        guard let  backgroundview = headerView.subviews.first else{
            return
        }
        
        backgroundview.frame = headerView.bounds
        //Add instagram logo
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4, y: headerView.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.hight - view.safeAreaInsets.top)
        
        }
    
    
    private func addSubViews(){
        
        view.addSubview(userNameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginBtn)
        view.addSubview(termsBtn)
        view.addSubview(privacyBtn)
        view.addSubview(createAccountBtn)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginBtn(){
        userNameEmailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let userNameEmail = userNameEmailTextField.text, !userNameEmail.isEmpty,
              let  password = passwordTextField.text , !password.isEmpty , password.count >= 8 else {
                return
              }
      //  Login Functionality
        var username:String?
        var email:String?
        
        if userNameEmail.contains("@"), userNameEmail.contains(".")
        {
            email = userNameEmail
        }
        else{
            
            username = userNameEmail
        }
      let  shared = AuthManger()
        
        shared.loginUser(userName: username, email: email, password: password) { sucess in
            DispatchQueue.main.async {
            
                if sucess{
                    //In case user is logged in
                    self.dismiss(animated: true, completion: nil)
                }
                
                //In case error occured
                
                let alert = UIAlertController(title: "Login error", message: "we were unable to logged you in", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
            }
            
            }
           
        
    }
    
    
    @objc private func didTaptermsBtn(){
        guard let url = URL( string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/"  )else{
            return
        }
        let vc = SFSafariViewController(url: url)
       present(vc, animated: true)
    }
    
    @objc private func didTapprivacyBtn(){
        
        guard let url = URL( string: "https://help.instagram.com/519522125107875"  )else{
            return
        }
        let vc = SFSafariViewController(url: url)
       present(vc, animated: true)
    }
    @objc private func didTapCreateAccount(){
        
        let vc = RegistrationViewController()
//        vc.modalPresentationStyle = .fullScreen
        present (vc , animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameEmailTextField {
            
            passwordTextField.becomeFirstResponder()
        }else if  textField == passwordTextField {
            
            didTapLoginBtn()
        }
        return true
    }
}
