//
//  ViewController.swift
//  FirstStoryboard
//
//  Created by 이동규 on 2021/01/31.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func presentModalVC(_ sender: Any) {
        
        // storyboard ID 사용해서 화면 연결
        // 서브 스토리보드로 옮기게되면 먼저 스토리보드 객체를 만들고 생성해야한다.
        let subStoryboard = UIStoryboard(name: "Sub", bundle: nil)  // 동일한 번들에 포함되어 있으므로 nil
        let vc =  subStoryboard.instantiateViewController(withIdentifier: "modalVC")
        present(vc, animated: true, completion: nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

