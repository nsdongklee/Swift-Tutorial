//
//  ViewController.swift
//  SubmitValue
//
//  Created by 이동규 on 2021/09/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    

    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            self.isUpdateText.text = "갱신되었음"
        } else {
            self.isUpdateText.text = "갱신못함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
//    @IBAction func onSubmit(_ sender: Any) {
//        //VC2 의 인스턴스를 여기에 생성
//        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? GetDataViewController else {
//            return
//        }
//        // 전달되는 값을 여기서 처리하고 화면전환 처리또한 프레젠테이션으로
//        rvc.paramEmail = self.email.text!
//        rvc.paramUpdate = self.isUpdate.isOn
//        rvc.paramInterval = self.interval.value
//
//        // 화면전달방식: 프레젠테이션방식은 present-dismiss 네비게이션컨트롤러는 push-pop
////        self.present(rvc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(rvc, animated: true)
//
//    }
    
    // 세그웨이 실행 전 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //목적지 뷰의 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        guard let rvc = dest as? GetDataViewController else {
            return
        }
        // 값 전달
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    
    // 세그웨이로 화면전환 및 값 전달 연습
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

