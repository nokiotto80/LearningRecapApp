//
//  LoadingView.swift
//  LearningRecapApp
//
//  Created by Vincenzo Pugliese on 15/01/2018.
//  Copyright © 2018 Vincenzo Pugliese. All rights reserved.
//

import UIKit

class LoadingView: UIViewController {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageViewLoad: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
//        spostato tutto nel ViewDidAPpear se no non funciona
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         activityIndicator.startAnimating()
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(5)
        print("trascorsi 5 secondi")
        activityIndicator.stopAnimating()
        goToApp()
    }
    override func viewWillDisappear(_ animated: Bool) {
     
        super.viewWillDisappear(animated)
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    func goToApp() {
        activityIndicator.stopAnimating()
        performSegue(withIdentifier: "fromLaunchToApp", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

