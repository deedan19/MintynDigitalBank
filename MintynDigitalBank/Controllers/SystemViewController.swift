//
//  SystemViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 12/11/2021.
//

import UIKit

class SystemViewCOntroller: UIViewController {
    @IBOutlet weak var systemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        systemTableView.separatorStyle = .none
        title = "Systems"
        systemTableView.delegate = self
        systemTableView.dataSource = self
    }
    
}

extension SystemViewCOntroller: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Appearance"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemModelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "systemCell", for: indexPath)
        cell.textLabel?.text = systemModelData[indexPath.row].title
        cell.imageView?.image = UIImage()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            print("Light Mode Activated")
        case 2:
            print("Dark Mode Activated")
            
        default:
            print("Default mode")
        }
    }
    
    
}
