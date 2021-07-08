//
//  RegistrationViewController.swift
//  InstaFireBase
//
//  Created by A.M on 6/22/21.
//

import UIKit

class RegistrationViewController: UIViewController {

    struct Constants {
        static let cornerRadious:CGFloat = 8.0
        
    }
    
    
    private let  usernameField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Enter Username"
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
    
    private let  emailField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Enter Email "
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
    private let  passwordField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Enter password "
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
    
    private let  regiserBtn: UIButton = {
       let button = UIButton()
        button.setTitle("Signup", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadious
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regiserBtn.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        usernameField.delegate = self
        passwordField.delegate = self
        emailField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(regiserBtn)
        
        view.backgroundColor = .systemBackground
    
    
    }
    
    override func viewDidLayoutSubviews() {
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10 , width: view.width - 40 , height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10 , width: view.width - 40 , height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10 , width: view.width - 40 , height: 52)
        regiserBtn.frame = CGRect(x: 20, y: passwordField.bottom + 10 , width: view.width - 40 , height: 52)


    }
    
    @objc private func didTapRegister(){
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
            
              let password = passwordField.text , !password.isEmpty ,password.count >= 8 ,
              let username = usernameField.text ,username.isEmpty else{
        return 
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegistrationViewController:UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            didTapRegister()
        }
        return true
    }

}
