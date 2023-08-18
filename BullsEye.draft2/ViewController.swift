//
//  ViewController.swift
//  BullsEye.draft2
//
//  Created by macOSGrey on 8/14/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(
          title: "Hello, World Peas",
          message: "This is my first app!",
          preferredStyle: .alert)
        let action = UIAlertAction(
          title: "Awesome",
          style: .default,
          handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

