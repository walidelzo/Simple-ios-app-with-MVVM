//
//  UserModel.swift
//  MVVM
//
//  Created by walid elzo on 2/4/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//
/*

 id: 2,
 name: "Ervin Howell",
 username: "Antonette",
 email: "Shanna@melissa.tv",
 address: {
 street: "Victor Plains",
 suite: "Suite 879",
 city: "Wisokyburgh",
 zipcode: "90566-7771",
 geo: {
 lat: "-43.9509",
 lng: "-34.4618"
 }
 },
 */

import Foundation
class User :Codable {
    var id:Int
    var name:String
    var username:String
    var email:String
   // var address:[String:String]
    //var geo:[String:String]
}
