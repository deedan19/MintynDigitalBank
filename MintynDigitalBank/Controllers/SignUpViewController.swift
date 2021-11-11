//
//  SignUpViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func registerButtonTapped () {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        guard let email = emailTF.text?.trimmingCharacters(in: .whitespaces), let password = passwordTF.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserRegisterError()
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] signInResult, error in
            if let err = error {
                print("Register Error --> \(err)")
            }
            if signInResult != nil {
                self?.alertUserSuccessSignUp()
            }
        }
    }
    
    private func alertUserRegisterError () {
         let alert = UIAlertController(title: "Woops", message: "Please enter all fields to create an account", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
         present(alert, animated: true, completion: nil)
     }
    
    private func alertUserSuccessSignUp () {
         let alert = UIAlertController(title: "Woops", message: "Please enter all fields to create an account. Log in now", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
     }
    
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        registerButtonTapped()
    }
}
