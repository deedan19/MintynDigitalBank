//
//  SignUpViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let registerUserAuth = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
    }
    
    
    private func registerButtonTapped () {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        guard let email = emailTF.text?.trimmingCharacters(in: .whitespaces), let password = passwordTF.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserRegisterError("Woops", "Enter all fields. Password must be 6 characters or more")
            return
        }
        
        registerUserAuth.registerUser(with: email, and: password) { [weak self] result, error in
            guard let err = error else { return }
            result ? self?.resgisterSuccessAlert() : self?.alertUserRegisterError("Error", "\(err.localizedDescription)")
            if result == true {
                self?.resgisterSuccessAlert()
            }
        }
    }
    
    private func alertUserRegisterError (_ title: String, _ message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
         present(alert, animated: true, completion: nil)
     }
    
    private func resgisterSuccessAlert () {
         let alert = UIAlertController(title: "Success", message: "Account successfully created", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
                
//                , completion: {
//            self.emailTF.text = ""
//            self.passwordTF.text = ""
//        })
     }

    
    @IBAction func didTapRegisterButton () {
        registerButtonTapped()
    }
}


