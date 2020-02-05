//
//  UserViewModel.swift
//  MVVM
//
//  Created by walid elzo on 2/5/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//

import Foundation
class UserViewModel {
   private var usersFormApi = [User]()
   private let apiHandel = ApiHandler()

    func getUsers(completionHandler: @escaping ([User])->()) {
        apiHandel.getUsers { (compltionUsers) in
            self.usersFormApi = compltionUsers
            completionHandler(compltionUsers)
        }
    }
    
    func numberOfUsers()->Int {
        return usersFormApi.count
    }
    
    func getUser(forIndex index :Int )->User {
        return usersFormApi[index]
    }
    
}
