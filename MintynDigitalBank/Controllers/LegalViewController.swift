//
//  LegalViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 12/11/2021.
//

import UIKit


class LegalViewController: UIViewController {
    @IBOutlet weak var mintAccTermsAndC: UITextView!
    @IBOutlet weak var mintPrivacyPolicy: UITextView!
    @IBOutlet weak var mintSavingGoalTermsAndC: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLinks()
    }
    
    
    
    func setupLinks ()  {
        
        let termsAndConditionLink = "https://bankwithmint.com/privacy-policy"
        let privacyLink = "https://bankwithmint.com/privacy-policy"
        let savingsGoalsLink = "https://bankwithmint.com/goal-based-savings"
        
        let text1 = "Mint Account - Terms and Condition"
        let text2 = "Privacy Policy"
        let text3 = "Savings Goals - Terms and Condition"
        
        let mintAccAttributedString = NSAttributedString.makeHyperLink(for: termsAndConditionLink, in: text1, as: text1)
        
        let privacyAttributedString = NSAttributedString.makeHyperLink(for: privacyLink, in: text2, as: text2)
        let savingGoalsAttributtedString = NSAttributedString.makeHyperLink(for: savingsGoalsLink, in: text3, as: text3)
        
        mintAccTermsAndC.attributedText = mintAccAttributedString
        mintAccTermsAndC.font = UIFont.systemFont(ofSize: 16)
        
        mintPrivacyPolicy.attributedText = privacyAttributedString
        mintPrivacyPolicy.font = UIFont.systemFont(ofSize: 16)
        
        mintSavingGoalTermsAndC.attributedText = savingGoalsAttributtedString
        mintSavingGoalTermsAndC.font = UIFont.systemFont(ofSize: 16)
        
        
    }
    
    
    
    
}
