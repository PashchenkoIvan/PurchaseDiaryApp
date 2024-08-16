//
//  PurchaseCategoryTableViewCell.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 13.08.2024.
//

import UIKit

class PurchaseCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameTextField: UILabel!
    @IBOutlet weak var categoryCountTextField: UILabel!
    @IBOutlet weak var categorySpentTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
