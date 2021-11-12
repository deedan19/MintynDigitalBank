//
//  LoginViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var serviceCollectionView: UICollectionView!
    @IBOutlet weak var baseViewWrapper: UIView!
    @IBOutlet weak var phoneTFWrapper: UIView!
    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var passWordTFWrapper: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private let loginAuth = AuthManager()
    var toggleChecker = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serviceCollectionView.delegate = self
        serviceCollectionView.dataSource = self
        setupViews()
    }
    
    private func setupViews () {
        passwordTF.isSecureTextEntry = true
        passwordTF.leftView = UIView (frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textFieldWrapperStyling([phoneTFWrapper, passWordTFWrapper])
        styleCheckBox()
        styleLoginButton()
        styleBaseViewWrapper()
    }
    
    private func textFieldWrapperStyling (_ uiViews: [UIView]) {
        uiViews.forEach { viewToStyle in
            viewToStyle.layer.borderWidth = 1
            viewToStyle.layer.borderColor = UIColor.lightGray.cgColor
            viewToStyle.layer.cornerRadius = 8
            viewToStyle.layer.opacity = 0.5
            // Background Colour
        }
    }
    private func styleCheckBox () {
        checkBox.layer.borderWidth = 1
        checkBox.layer.borderColor = UIColor.lightGray.cgColor
        checkBox.layer.cornerRadius = 4
    }
    
    private func styleLoginButton () {
        loginButton.layer.cornerRadius = 8
    }
    
    private func styleBaseViewWrapper () {
        baseViewWrapper.clipsToBounds = true
        baseViewWrapper.layer.cornerRadius = baseViewWrapper.frame.size.width / 10.0
        baseViewWrapper.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func alertUserLoginError ( _ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func toHomeScreen () {
        guard let homeScreenVC = storyboard?.instantiateViewController(withIdentifier: "baseTabBar") as? UITabBarController else { return }
        homeScreenVC.modalPresentationStyle = .fullScreen
        self.present(homeScreenVC, animated: true, completion: nil)
    }
    
    private func loginButtonTapped () {
        phoneNumTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
       
        let email = phoneNumTF.text!, password = passwordTF.text!
        if email.isEmpty || password.isEmpty {
            alertUserLoginError("Woops", "Fill all fields to log in")
        } else {
            
            loginAuth.loginUser(with: email, and: password) {[weak self] result in
                self?.phoneNumTF.text = ""
                self?.passwordTF.text = ""
                result ? self?.toHomeScreen() :  self?.alertUserLoginError("Error", "\(self?.loginAuth.errorHandler?.localizedDescription ?? "Login Error")")
            }
        }
    }
    

    
    @IBAction func markCheckBox () {
        toggleChecker.toggle()
        toggleChecker ?  checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal) :  checkBox.setImage(UIImage(), for: .normal)
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        loginButtonTapped()
    }
}



extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serviceCellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ServiceCell
        cell.layer.cornerRadius = 5
        cell.configureCell(with: serviceCellModels[indexPath.item])
        if indexPath.item == 0 {
            cell.comingSoonLabel.text = "Coming soon..."
        } else {
            cell.comingSoonLabel.text = ""
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.size.width - 55) / 2)
        return .init(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneNumTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            loginButtonTapped()
        }
        return true
    }
}

