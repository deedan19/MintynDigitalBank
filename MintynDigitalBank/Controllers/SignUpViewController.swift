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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    private func registerButtonTapped () {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        guard let email = emailTF.text?.trimmingCharacters(in: .whitespaces), let password = passwordTF.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserRegisterError("Woops", "Enter all fields. Password must be 6 characters or more")
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] createUserResult, error in
            
            guard let err = error else { return }
            if  createUserResult == nil {
                self?.alertUserRegisterError("Error", "\(err.localizedDescription)")
            } else {
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
        present(alert, animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
     }

    
    @IBAction func didTapRegisterButton () {
        registerButtonTapped()
    }
}


