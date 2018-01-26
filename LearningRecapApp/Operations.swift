//  Operations.swift
//  ExercisesVincentJan2018
//
//  Created by Vincenzo Pugliese on 08/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class Operationsr: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return numbers100.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers100[row])
    }
    var numbers100  : [Int] = [] // inizializzazione
 
    func alert()
    {
    let alertController = UIAlertController(title: "Touches began,Alert", message:
        "Questa è una alert,SWIPE riuscito!!", preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "close", style: UIAlertActionStyle.default,handler: nil))
    //
               self.present(alertController, animated: true, completion: nil)
        
    }
    //tap gesture recognizer,funzione in ObjectiveC
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
            imageViewRight.isHidden = false
//            sleep(4)
            performSegue(withIdentifier: "SegueTableViewController",sender: self)
             alert()
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            imageViewLeft.isHidden = false
          //  sleep(2)
            sleep(4)
            
            alert()
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.up {
            print("Swipe Up")
            imageViewUp.isHidden = false
//            sleep(4)
            alert()
            imageViewUp.isHidden = true
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.down {
            print("Swipe Down")
            imageViewDown.isHidden = false
            
//            sleep(4)
            alert()
        }
//        sleep(100)
//       imageViewUp.isHidden = true
//       imageViewDown.isHidden = true
//        imageViewRight.isHidden = true
//        imageViewLeft.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        for  i in 1...100 {
            numbers100.append(i)  //assafaMaronn,arriva fino a 100
        }

        //populate the array
         print(numbers100)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var labelOperations: UILabel!
    
    @IBOutlet weak var imageViewUp: UIImageView!
    @IBOutlet weak var imageViewDown:
    
    UIImageView!
    
    @IBOutlet weak var imageViewRight: UIImageView!
    
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblValue: UILabel!

    @IBAction func btnCheck(_ sender: UIButton) {
        
       // print the selected value of picker
        
        var selectedValue = picker1.selectedRow(inComponent: 0)
            print(selectedValue+1)
        
        var selectedValue1 = picker1.selectedRow(inComponent: 1)
        print(selectedValue1+1)

        if selectedValue >= selectedValue1 {

            txtView.text = "il valore selezionato del primo picker  \(selectedValue+1)  è maggiore (o uguale) del valore \(selectedValue1+1) del secondo picker"
        }
        else {
                txtView.text = "il valore selezionato del primo picker  \(selectedValue+1)  è minore del valore \(selectedValue1+1) del secondo picker"
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
 
        }
}
