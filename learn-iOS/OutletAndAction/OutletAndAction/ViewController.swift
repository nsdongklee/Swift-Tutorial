//
//  ViewController.swift
//  OutletAndAction
//
//  Created by 이동규 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func doSomething(_ sender: Any) {
        lbl.text = "Hi~!"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

