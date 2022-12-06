//
//  ViewController.swift
//  diagnosisOfAnemiaApp
//
//  Created by macbookair on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func startToTest(_ sender: UIButton) {
        performSegue(withIdentifier: "secondDetailVC", sender: nil)
    }
    
    
    
}

