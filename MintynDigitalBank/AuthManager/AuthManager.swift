//
//  AuthManager.swift
//  MintynDigitalBank
//
//  Created by Decagon on 12/11/2021.
//

import UIKit
import FirebaseAuth

class AuthManager {
    func registerUser (with email: String, and password: String, completion: @escaping ((Bool, Error?)->())) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { registerUserRes , error in
            guard error == nil else {
                completion(false,error)
                return
            }
            
            if registerUserRes != nil {
                completion(true, nil)
            }
            
        }
    }
    
    func loginUser (with email: String, and password: String, completion: @escaping ((Bool, Error?)->())) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { loginRes , error in
            guard error == nil else {
                completion(false, error)
                return
            }
            
            if loginRes != nil {
                completion(true, nil)
            }
        }
    }
}
