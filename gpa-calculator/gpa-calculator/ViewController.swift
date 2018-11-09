//
//  ViewController.swift
//  gpa-calculator
//
//  Created by Harjas Monga on 9/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var classes: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        classes.append(Class(name: "cs 180", credits: 3, grade: "A"))
        classes.append(Class(name: "cs 190", credits: 1, grade: "B"))
        classes.append(Class(name: "cs 200", credits: 2, grade: "C"))
        classes.append(Class(name: "cs 210", credits: 5, grade: "F-"))
        classes.append(Class(name: "cs 220", credits: 2, grade: "A++"))
        classes.append(Class(name: "cs 230", credits: 0, grade: "B"))

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassTableViewCell
        let classItem = classes[indexPath.row]
        cell.classNameLabel.text = classItem.name
        cell.credistLabel.text = String(classItem.credits)
        cell.gradeLabel.text = classItem.name
        return cell
    }


}

