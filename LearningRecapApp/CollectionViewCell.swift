//
//  CollectionViewCell.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 12/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
  
    @IBOutlet weak var btnBigImage: UIButton!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBAction func btnBigImage(_ sender: UIButton) {
        
        
//forced touch
//     performSegue(withIdentifier: "Cell_Image", sender: btnBigImage)

    }
    @IBOutlet weak var lblCell: UILabel!
    
    
}


