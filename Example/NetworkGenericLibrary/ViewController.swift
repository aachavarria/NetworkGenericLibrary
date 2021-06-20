//
//  ViewController.swift
//  NetworkGenericLibrary
//
//  Created by aachavarria on 06/19/2021.
//  Copyright (c) 2021 aachavarria. All rights reserved.
//

import UIKit
import NetworkGenericLibrary

class ViewController: UIViewController {

    var network: Network?
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network = Network(session: session)
        network?.get(url: "https://jsonplaceholder.typicode.com/posts", type: [Post].self, complete: { result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        })
        
        network?.put(url: "https://jsonplaceholder.typicode.com/posts/1", type: Post.self, object: Post(userId: 1, id: 1, title: "edited", body: "edited")) {
            result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        }
        
        network?.post(url: "https://jsonplaceholder.typicode.com/posts", type: Post.self, object: Post(userId: 1, title: "new", body: "new")) {
            result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        }
        
        network?.delete(url: "https://jsonplaceholder.typicode.com/posts/1") {
            result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        }
//
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

