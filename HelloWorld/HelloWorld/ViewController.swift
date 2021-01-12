//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이동규 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func updateLabel(_ sender: Any) {
        label.text = "Hello iOS"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

