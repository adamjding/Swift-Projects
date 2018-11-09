//
//  AddViewController.swift
//  gpa-calculator
//
//  Created by Harjas Monga on 9/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var gradeLabel: UITextField!
    @IBOutlet weak var creditsLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let classEntry = Class(name: nameLabel.text!, credits: Int(creditsLabel.text!)!, grade: gradeLabel.text!)
        
        
    }
    
}
