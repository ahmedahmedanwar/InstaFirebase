//
//  DatabaseManger.swift
//  InstaFireBase
//
//  Created by A.M on 6/26/21.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public class DatabaseManger {
    
 static let shared = DatabaseManger()
    private let database = Database.database().reference()
    
    //MARK:- public
    
    //Check if username is avilable
    // -email:String represinting email
    // -username:String represinting username
    
    
    public func canCreateNewUser(with email:String,  username:String, completion:(Bool)-> Void ){
        
        completion(true)
        
    }
    
    public func insertNewUser(username: String ,email: String, completion: @escaping (Bool)-> Void ){
        
        
        //insert New User to database
        // -email:String represinting email
        // -username:String represinting username
        // -completion: Async callback for result if database entry succed s
        
        database.child(email.safeDatabaseKey()).setValue(["username":username]) { error, _ in
            if error ==  nil {
                //succed
                completion(true)
                return
                
            }
            else{
                //failed
                completion(false)
            }
            
        }
        
    }
    
   
    
}
