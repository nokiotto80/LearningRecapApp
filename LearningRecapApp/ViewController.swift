
//  ViewController.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 11/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
import UIKit

class ViewController: UIViewController {
    
    var contatoreVocali: Int! //count vocals and consonants
    var contatoreConsonanti: Int!

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
    
    @IBOutlet weak var textBox3: UITextView!
    
    @IBOutlet weak var switchHide: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var imageViewSlider: UIImageView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var lblSlider: UILabel!
    @IBOutlet weak var txtVocali: UITextField!
    
    @IBOutlet weak var labelTestoVocali: UILabel!
    
    @IBOutlet weak var lblVocali: UILabel!
    
    @IBOutlet weak var lblConsonanti: UILabel!
    
    
    @IBOutlet weak var btnVocali: UIButton!
    
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
//SWITHC Action per nascondere
    //aCtion UiSlider
    
    @IBAction func switchHide(_ sender: UISwitch) {
        
    }
    
    @IBAction func slider(_ sender: UISlider) {
     lblSlider.text = String(slider.value)
        
    }
    
    @IBAction func txtVocali(_ sender: UITextField) {
        self.txtVocali.becomeFirstResponder()
    }
    
    //STepper action
    @IBAction func stepper(_ sender: UIStepper) {
        lblSlider.text = String(stepper.value)
        //quando muovo 1 si muove anche laltro
        slider.value = Float(stepper.value)
    }
    
//action conta vocali

    @IBAction func btnVocali(_ sender: UIButton) {
        var textToCount : String
        var _ : Int

        textToCount = txtVocali.text!

        //inizialIZZIAMO i contatori e li azzeriamo ogni volta premo bottone
        contatoreVocali = 0
        contatoreConsonanti = 0
        
        for (_, char) in textToCount.characters.enumerated() {
            
        switch char {
       
            case "a","A","à":
                contatoreVocali = contatoreVocali+1
            case "e","E","è":
                contatoreVocali = contatoreVocali+1
            case "i","I","ì":
                contatoreVocali = contatoreVocali+1
            case "o","O","ò":
                contatoreVocali = contatoreVocali+1
            case "u","U","ù":
                contatoreVocali = contatoreVocali+1
            default:   //in caso non rientra tra i 5 casi  è una consonante
              contatoreConsonanti = contatoreConsonanti+1
             print("Another consonant")
            }
        }
        lblVocali.text  = "Vocali: "
        lblConsonanti.text   = "Conson: "
        
        lblVocali.text = lblVocali.text! + " \(contatoreVocali!)"
        lblConsonanti.text = lblConsonanti.text! + " \(contatoreConsonanti!)"
}
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        self.view.backgroundColor = defaults.object(forKey: "Color") as? UIColor
        // Do any additional setup after loading the view, typically from a nib.
        btnSwap.layer.borderWidth = 2
        btnSwap.layer.borderColor = UIColor.black.cgColor
        self.txtVocali.delegate = self as? UITextFieldDelegate
        
        self.textBox3.delegate  = self as? UITextViewDelegate

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //when we tap outside the keyboard it hides
     func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.txtVocali.resignFirstResponder()
        self.textBox3.resignFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(self.view.backgroundColor, forKey: "Color")
    }
}
