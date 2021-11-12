//
//  SettingsViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 10/11/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    
    private let logoutAuth = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return settingsData.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return settingsData[section].profileSettings?.count ?? 0
        return settingsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.imageView?.image = UIImage(systemName: settingsData[indexPath.row].icon)
        cell.imageView?.tintColor = .lightGray
        cell.textLabel?.text = settingsData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case  3:
            toLegalsScreen()
        case 5:
            toSystemScreen()
        case 7:
            logout()
        default:
            break
        }
    }
    
    private func toLegalsScreen () {
        guard let legalControler = storyboard?.instantiateViewController(withIdentifier: "LegalViewController") as? LegalViewController else { return }
        navigationController?.pushViewController(legalControler, animated: true)
    }
    
    private func toSystemScreen () {
        guard let legalControler = storyboard?.instantiateViewController(withIdentifier: "SystemViewCOntroller") as? SystemViewCOntroller else { return }
        navigationController?.pushViewController(legalControler, animated: true)
    }
    
    private func alertUserLogoutError ( _ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func logout () {
        logoutAuth.userLogOut {[weak self] logoutResult in
            logoutResult ? self?.dismiss(animated: true, completion: nil) : self?.alertUserLogoutError("Woops", "\(self?.logoutAuth.errorHandler?.localizedDescription ?? "Can't log out")")
        }
    }
    
}


