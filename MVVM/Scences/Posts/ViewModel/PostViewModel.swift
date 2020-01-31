//
//  PostViewModel.swift
//  MVVM
//
//  Created by walid elzo on 1/29/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//

import Foundation
class PostViewModel {
   private let getPostFromApi = ApiHandler()
   private var arrayOfPosts = [Post]()
    typealias completionHandler = ([Post])->()
    func getAllPost(completionHandler:@escaping completionHandler) {
        getPostFromApi.getPosts { [weak self] (AllPosts) in
            self!.arrayOfPosts = AllPosts
            completionHandler(AllPosts)
        }
    }
    
    func getNumberOfPosts()->Int {
        return arrayOfPosts.count
    }
    
    func getAPost(WithIndex index :Int)->Post {
        return arrayOfPosts[index]
    }
    
}
