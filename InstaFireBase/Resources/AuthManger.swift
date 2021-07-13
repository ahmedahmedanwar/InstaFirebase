//
//  AuthManger.swift
//  InstaFireBase
//
//  Created by A.M on 6/27/21.
//

import Foundation
import FirebaseAuth

public class AuthManger {
    
    static let shared = AuthManger()
    
    
    //MARK:- public
    
    public func registerNewUser(username: String, email:String , password:String, completion: @escaping (Bool)-> Void){
        /*
         - Check if username is avilabel.
         - Check if email is avilable.
         - Cerate Account.
         - insert account to database.
         */
        DatabaseManger.shared.canCreateNewUser(with: email, username: username) { canCreate in
            
            if canCreate{
                /*
                 - Cerate Account.
                 - insert account to database.
                 */
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil , result != nil else {
                        //Firebase auth couldnot create account
                        completion(false)
                        return
                    }
                    //Insert User To database
                    DatabaseManger.shared.insertNewUser(username: username, email: email){ inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            // Failed To insert to database.
                            
                            completion(false)
                            return
                            
                        }
                    }
                }
            }
            
            // either username or email dosnn't exist
            
            else {
                completion(false)
            }
        }
        
    }
    
    public func loginUser(username:String?, email:String? , password:String, completion: @escaping (Bool) ->Void ){
        if let email = email{
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil , error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // userName login
            print(username)
        }
    }
    
    
}



