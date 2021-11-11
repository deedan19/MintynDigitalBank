//
//  TransactionCollectionViewCell.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class TransactionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var transactionImage: UIImageView!
    @IBOutlet weak var transactionTitle: UILabel!
    
    func configureTransactionCell (with model: TransactionModel) {
        transactionImage.image = UIImage (named: model.transactionIcon)
        transactionTitle.text = model.transactionTitle
    }
}
