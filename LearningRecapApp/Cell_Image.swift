//
//  Cell_Image.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 16/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class Cell_Image: UIViewController {

    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var btnBack: UIButton!
    var immagine: UIImage!  //passata dalla View CollectionViewController

    
    //button Action,torna indietro
    @IBAction func btnBack(_ sender: UIButton) {
        performSegue(withIdentifier: "backTabBar", sender: btnBack)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewCell.image = immagine

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
