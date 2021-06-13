//
//  ViewController.swift
//  LearnCoreData
//
//  Created by 이동규 on 2021/02/10.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // 계산 속성 추가
    var context: NSManagedObjectContext {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        // 정상적으로 바인딩 되었다면 컨테이너에 접근후 뷰컨텍스트
        return app.persistentContainer.viewContext
        
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func createEntity(_ sender: Any) {
        // 입력된 값 상수에 저장
        guard let name = nameField.text else { return }
        guard let val = ageField.text, let age = Int(val) else { return }
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        
        // 키밸류 속성으로 저장
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        
        // 저장되지 않은 변경사항 확인해보기
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                print(error)
            }
        }
        
        nameField.text = nil
        ageField.text = nil
    }
    
    @IBAction func readEntity(_ sender: Any) {
        // 읽어들일 데이터를 요청
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let list = try context.fetch(request)
            
            if let first = list.first {
                nameField.text = first.value(forKey: "name") as? String
                
                if let age = first.value(forKey: "age") as? Int {
                    ageField.text = "\(age)"
                }
                
                // 업데이트를 위한 상수 저장
                editTarget = first
            } else {
                print("Not Found")
            }
        } catch {
            //
        }
    }
    
    // 업데이트를 구현을 위한 속성 추가
    var editTarget: NSManagedObject?
    
    @IBAction func updateEntitu(_ sender: Any) {
        // 입력된 값 상수에 저장
        guard let name = nameField.text else { return }
        guard let val = ageField.text, let age = Int(val) else { return }
        
        if let target = editTarget {
            target.setValue(name, forKey: "name")
            target.setValue(age, forKey: "age")
        }
        
        // 저장되지 않은 변경사항 확인해보기
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                print(error)
            }
        }
        
        nameField.text = nil
        ageField.text = nil
    }
    
    @IBAction func deleteEntity(_ sender: Any) {
        
        if let target = editTarget {
            context.delete(target)  // 컨텍스트에서 삭제, 저장소는 아직 남아있음
        }
        
        // 저장되지 않은 변경사항 확인해보기
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                print(error)
            }
        }
        
        nameField.text = nil
        ageField.text = nil
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

