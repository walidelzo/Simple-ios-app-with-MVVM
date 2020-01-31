//
//  PostVC.swift
//  MVVM
//
//  Created by walid elzo on 1/28/20.
//  Copyright © 2020 walid elzo. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    let postModelView :PostViewModel = PostViewModel()
    @IBOutlet weak var postIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.delegate = self
        postTableView.dataSource = self
        postModelView.getAllPost { (_) in
            DispatchQueue.main.async { [weak self] in
                self!.postTableView.reloadData()
                self!.postIndicator.stopAnimating()
            }
        }
    }
    

}
extension PostVC:UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModelView.getNumberOfPosts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
        let currentPost = postModelView.getAPost(WithIndex: indexPath.row)
        cell.textLabel?.text = currentPost.title
        return cell
    }
    
    
}
