//
//  ViewController.swift
//  CustomSegue
//
//  Created by 이동규 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 커스텀 세그웨이가 실해되기 전에 실행할 메소드 오버라이딩
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("세그웨이가 곧 실행된다.\n세그웨이 ID: \(segue.identifier!)")
    }

}

