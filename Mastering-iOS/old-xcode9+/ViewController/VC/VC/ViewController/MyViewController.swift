//
//  MyViewController.swift
//  VC
//
//  Created by 이동규 on 2021/01/28.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBAction func fromCode(_ sender: Any) {
        let vc = UIViewController(nibName: "CustomNibViewController", bundle: nil)
//        let vc = UIViewController()
//        vc.view.backgroundColor = UIColor.red
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
