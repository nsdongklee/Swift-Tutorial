//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class MultiSectionTableViewViewController: UIViewController {
    
    // 이미지 생성과 관련된 리스트 생성
    let list = PhotosSettingSection.generateData()
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      
   }
    @objc func switchChanged(_ sender: UISwitch) {
        print(sender.isOn)
    }
}

extension MultiSectionTableViewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        switch target.type {
        case .detailTitle:
            cell.textLabel?.text = target.title
            cell.detailTextLabel?.text = target.subTitle
            cell.imageView?.image = UIImage(named: target.imageName!)
        case .switch:
            cell.textLabel?.text = target.title
            if let switchView = cell.accessoryView as? UISwitch {
                switchView.isOn = target.on
            }
        case .checkmark:
            cell.textLabel?.text = target.title
            cell.accessoryType = target.on ? .checkmark : .none
        }
        
        return cell
    }
    
    // 헤더 푸터로 구분
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return list[section].footer
    }
}




















