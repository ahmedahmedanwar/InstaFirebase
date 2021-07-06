//
//  ViewController.swift
//  InstaFireBase
//
//  Created by A.M on 6/21/21.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        handelNotAuthenticated()
        
        let homeViewController = HomeViewController()
        
        homeViewController.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handelNotAuthenticated()
        
    }

     func handelNotAuthenticated(){
    
    //check Authinticated Useres
        if Auth.auth().currentUser == nil{
        //Show login
            
         let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            
            present(loginVc,animated: false)
            
        }
        
    }

}



