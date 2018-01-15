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
     activityIndicator.startAnimating()
    self.goToApp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    UIApplication.shared.isStatusBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    UIApplication.shared.isStatusBarHidden = false
    }
    
    func goToApp() {
    
    performSegue(withIdentifier: "carica", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
}
