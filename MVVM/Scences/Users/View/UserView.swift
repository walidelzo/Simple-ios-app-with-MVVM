//
//  UserView.swift
//  MVVM
//
//  Created by walid elzo on 2/5/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//

import UIKit

class UserView: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var userModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
            self.userModel.getUsers { (_) in
                DispatchQueue.main.sync {
                    [weak self] in
                    self?.userTableView.reloadData()
            }
        }
    }
    


}


extension UserView :UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userModel.numberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: "userCell") else {
            return UITableViewCell()
        }
        let selectedUser = userModel.getUser(forIndex: indexPath.row)
        userCell.textLabel?.text = "\(String(describing: selectedUser.name))"
        return userCell
    }
    
    
}
