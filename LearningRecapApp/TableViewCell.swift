//
//  TableViewCell.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 17/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var lblNomeCognome: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
