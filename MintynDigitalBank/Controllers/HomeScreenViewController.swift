//
//  HomeScreenViewController.swift
//  MintynDigitalBank
//
//  Created by Decagon on 10/11/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var copyButton: UIButton!
    
    @IBOutlet weak var balanceViewWrapper: UIView!
    @IBOutlet weak var fundAccButton: UIButton!
    @IBOutlet weak var hideBalanceSwitch: UISwitch!
    @IBOutlet weak var transactionViewWrapper: UIView!
    @IBOutlet weak var baseViewWrapper: UIView!
    
    @IBOutlet weak var transactionCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionCollectionView.delegate = self
        transactionCollectionView.dataSource = self
        setupHomeScreenStyles()
        setupFloatingButton()
        balanceBGGradientColour()
    }
    
    private func setupHomeScreenStyles () {
        hideBalanceSwitch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        baseViewWrapper.layer.cornerRadius = baseViewWrapper.frame.size.width / 10.0
        baseViewWrapper.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        copyButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14.0)
        fundAccButton.titleLabel?.font = UIFont(name: "Helvetica", size: 12.0)
    }
    
    private func balanceBGGradientColour () {
        // Fix gradient
    }
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemBrown
        button.tintColor = .white
        return button
    }()
    
    private func setupFloatingButton () {
        let buttonSize: CGFloat = 60
        floatingButton.layer.cornerRadius = 30
        let yPosition: CGFloat = ((view.frame.size.height) + (view.frame.origin.y)) - 170
        let xPosition: CGFloat = ((view.frame.size.width) + (view.frame.origin.x)) - 80
        floatingButton.frame = CGRect(x:xPosition, y:yPosition , width: buttonSize, height: buttonSize)
        view.addSubview(floatingButton)
    }
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = transactionCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TransactionCollectionViewCell
        cell.configureTransactionCell(with: transactionModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 70, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 24, bottom: 5, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    

    
    
}
