//
//  TableViewVC.swift
//  segueSample
//
//  Created by 이동규 on 2021/10/19.
//

import Foundation
import UIKit

class TableViewVC: UITableViewController {
    
    var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TableViewVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userModel.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        return cell
    }

}
