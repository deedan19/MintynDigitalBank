//
//  AuthManager.swift
//  MintynDigitalBank
//
//  Created by Decagon on 12/11/2021.
//

import UIKit
import FirebaseAuth

class AuthManager {
    var errorHandler: Error?
    func registerUser (with email: String, and password: String, completion: @escaping ((Bool)->())) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) {[weak self] registerUserRes , error in
            if error != nil {
                self?.errorHandler = error
                completion(false)
            }
                completion(true)
        }
    }
    
    func loginUser (with email: String, and password: String, completion: @escaping ((Bool)->())) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) {[weak self] loginRes, error in
            
            if error != nil {
                self?.errorHandler = error
                completion(false)
            }
                completion(true)
        }
    }
    
    func userLogOut (completion: @escaping ((Bool)-> Void)) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
            errorHandler = error
        }
        
    }
}
