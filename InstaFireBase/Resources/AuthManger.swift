//
//  AuthManger.swift
//  InstaFireBase
//
//  Created by A.M on 6/27/21.
//

import Foundation
import FirebaseAuth

public class AuthManger {
    
   public let shared = AuthManger()
    
    //MARK:- public
    
    static func registerNewUser(userName:String, email:String , password:String){
        
        
    }
    
    public func loginUser(userName:String?, email:String? , password:String, completion: @escaping (Bool) ->Void ){
    if let email = email{
    // email login
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard authResult != nil , error == nil else {
                completion(false)
                return
            }
            completion(false)
          }
        }
    else if let username = userName {
           // userName login
            print(username)
        }
    }
    
    
        
    }


    
