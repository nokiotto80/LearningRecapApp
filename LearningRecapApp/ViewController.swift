//
//  ViewController.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 11/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageViewGeneral: UIImageView!
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var btnSwap: UIButton!
    
    
    //swap text in 2 textboxes
    @IBAction func btnSwap(_ sender: UIButton) {
        
        if (textBox1.text == ""  || textBox2.text == "") {
         print("Text empty")
        return //esce?
        }
        else {
            var temp:  String
            
            
            temp = textBox1.text!  //Variabile di scambio
            textBox1.text = textBox2.text
            textBox2.text = temp

             }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnSwap.layer.borderWidth = 2
        btnSwap.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


