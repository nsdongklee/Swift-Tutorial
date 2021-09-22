//
//  ViewController.swift
//  AlertWithUN
//
//  Created by 이동규 on 2021/09/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var msg: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBAction func save(_ sender: Any) {
        if #available(iOS 10.0, *) {
            //UserNotification
            // 1. 알람설정 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                    // 수락되어 있다면 알람관련 설정
                    // 이전 샘플코드와 로컬알림 세팅은 거의 유사하나 디스패치큐로 메인쓰레드에서 실행되게 해야함. UI처리라서
                    DispatchQueue.main.async {
                        // 1. 알림 컨텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!    // 텍스트 필드에서 직접 알람메세지 입력
                        nContent.title = "미리 알림"
                        nContent.sound = .default
                        // 2. 발송 시각을 "지금으로 부터 n초 형식" 으로 변환
                        let time = self.datePicker.date.timeIntervalSinceNow
                        // 3. 발송 조건
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        // 4. 발송 객체 생성
                        let request = UNNotificationRequest(identifier: "alarm",
                                                            content: nContent,
                                                            trigger: trigger)
                        // 5. 센터 추가
                        UNUserNotificationCenter.current().add(request) { (_) in
                            DispatchQueue.main.async {
                                // 메세지창 호출되도록
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                let alert = UIAlertController(title: "알림 등록",
                                                              message: "알림이 등록되었습니다. 알림은 \(date)",
                                                              preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                                alert.addAction(ok)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                } else {
                    let alert = UIAlertController(title: "알림 등록",
                                                  message: "알림이 허용되어 있지 않습니다.",
                                                  preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
        } else {
            //UILocalNotification
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

