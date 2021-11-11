//
//  StartScreenViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var greyBackGround: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleGreyBackground()
    }
    
    private func styleGreyBackground () {
        greyBackGround.clipsToBounds = true
        greyBackGround.layer.cornerRadius = greyBackGround.frame.size.width / 10.0
        greyBackGround.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
 
    
    @IBAction func toLoginScreenTapped(_ sender: UIButton) {
        guard let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func toSignUpScreenTapped(_ sender: UIButton) {
        guard let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
