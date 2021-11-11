//
//  ServiceCell.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    @IBOutlet weak var comingSoonLabel: UILabel!
    
    func configureCell (with model: ServiceCellModel) {
        imageView.image = UIImage(systemName: model.image)
        serviceTitleLabel.text = model.title
        
    }
    
}
