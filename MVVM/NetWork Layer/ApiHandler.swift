//
//  ApiHandler.swift
//  MVVM
//
//  Created by walid elzo on 1/28/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//

import Foundation
class ApiHandler {
    typealias completionPosts = ([Post])->()
    func getPosts (completionPosts:@escaping completionPosts) {
        //var ArrayOfPosts = [Post]()
        if let url = URL(string: EndPoints.postUrl)  {
            URLSession.shared.dataTask(with: url ,completionHandler: { (data, response, error) in
                if data != nil {
                    let jsoneDecoder = JSONDecoder()
                    let ArrayOfPosts = try? jsoneDecoder.decode([Post].self, from: data!)
                    if ArrayOfPosts != nil {
                        print(ArrayOfPosts!.count)
                        completionPosts(ArrayOfPosts!)
                    }else {
                        let AnArr = [Post]()
                        completionPosts(AnArr)
                    }
                    
                } else {
                    let arr = [Post]()
                    completionPosts(arr)
                }
                
                
            }).resume()
        }
    }
}
