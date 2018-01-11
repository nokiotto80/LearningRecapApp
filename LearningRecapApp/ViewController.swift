//
//  ViewController.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 11/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var ImageViewGeneral: UIImageView!
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var btnSwap: UIButton!
    
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnYellow: UIButton!
    @IBOutlet weak var btnCyan: UIButton!
    @IBOutlet weak var btnWhite: UIButton!
    
    @IBOutlet weak var btnSegue: UIButton!
    
   //actions dei bottoni
    @IBAction func btnRed(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.red
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
       }
    
    @IBAction func btnBlue(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.blue
    }
    
    @IBAction func btnYellow(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.yellow
        }
    
    @IBAction func btnCyan(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.cyan
    }
    
    //return white bg
    @IBAction func btnWhite(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.white

    }
    
    @IBAction func btnSegue(_ sender: UIButton) {
     performSegue(withIdentifier: "SegueViewController2", sender: btnSegue)
    }
    
    
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

func buttonSetupVariable(btns: [UIButton], currentButton: UIButton)
    
{
    for button in btns
        //other buttons reset
    {
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3
        
    }
    //when user press the button,it changes
    //thickness and color borders
    currentButton.layer.borderWidth = 3
    currentButton.layer.borderColor = UIColor.black.cgColor
    
}
