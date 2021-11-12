//
//  SettingsViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 10/11/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    
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
//        cell.isSelected
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
            dismiss(animated: true, completion: nil)
        default:
            print("Testing")
        }
    }
    
    
    
    
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return settingsData[section].title
//    }
    
    
    
    private func toLegalsScreen () {
        guard let legalControler = storyboard?.instantiateViewController(withIdentifier: "LegalViewController") as? LegalViewController else { return }
        navigationController?.pushViewController(legalControler, animated: true)
    }
    
    private func toSystemScreen () {
        guard let legalControler = storyboard?.instantiateViewController(withIdentifier: "SystemViewCOntroller") as? SystemViewCOntroller else { return }
        navigationController?.pushViewController(legalControler, animated: true)
    }
    
    func logout () {
        
    }
    
}


