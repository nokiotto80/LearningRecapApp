//
//  ViewController2.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 11/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    // OUTlets
    @IBOutlet weak var lblSegue: UILabel!    
    @IBOutlet weak var lblSegue2: UILabel!
    @IBOutlet weak var btnSegue: UIButton!
    
    @IBOutlet weak var lblLazy: UILabel!
    
    
    //Action btnSegue
    @IBAction func btnSegue(_ sender: UIButton) {
        
        //segue spostato alla TabBar se no essa scompare
        performSegue(withIdentifier: "back", sender: btnSegue)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
