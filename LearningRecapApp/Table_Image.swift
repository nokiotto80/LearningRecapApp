//
//  Table_Image.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 17/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class Table_Image: UIViewController {

    
    var nomeCognome: String!  //passata dalla ViewTableViewController

    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var imageViewTable: UIImageView!
    
    //Action of button
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "backButton", sender: UIBarButtonItem())
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNome.text = ("Nome stud. selez : "+(nomeCognome))

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
