//
//  TransactionModel.swift
//  MintynDigitalBank
//
//  Created by Decagon on 11/11/2021.
//

import Foundation


struct TransactionModel {
    let transactionIcon: String
    let transactionTitle: String
}

let transactionModel: [TransactionModel] = [
    TransactionModel(transactionIcon: "trans", transactionTitle: "Transfer"),
    TransactionModel(transactionIcon: "inv", transactionTitle: "Invest"),
    TransactionModel(transactionIcon: "pay", transactionTitle: "Pay Bill"),
    TransactionModel(transactionIcon: "saveM", transactionTitle: "Save Money"),
    TransactionModel(transactionIcon: "topup", transactionTitle: "Top Up"),
    TransactionModel(transactionIcon: "borrow", transactionTitle: "Borrow"),
    TransactionModel(transactionIcon: "more", transactionTitle: "More")
]

