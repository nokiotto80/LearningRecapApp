//
//  ViewController.swift
//  ExercisesVincentJan2018
//
//  Created by Vincenzo Pugliese on 08/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit



class ViewController4: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBAction func btnBack(_ sender: UIButton) {
        performSegue(withIdentifier: "backTabBar", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

