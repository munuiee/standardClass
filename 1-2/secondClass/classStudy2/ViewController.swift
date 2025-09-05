//
//  ViewController.swift
//  classStudy2
//
//  Created by 변지혜 on 8/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    let counter = Counter()

    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func executeCounter(_ sender: Any) {
        let result = counter.addCount()
        countLabel.text = "\(result)"
    }
    
    
}


