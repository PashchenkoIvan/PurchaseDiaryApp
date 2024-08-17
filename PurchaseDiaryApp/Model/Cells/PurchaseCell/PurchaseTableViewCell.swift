//
//  PurchaseTableViewCell.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 08.08.2024.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var purchaseNameLabel: UILabel!
    @IBOutlet weak var purchaseCategoryName: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
