//
//  ViewController.swift
//  NewsApp
//
//  Created by Dilshad P on 19/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        APICaller.shared.getTopStories{ result in
            switch result{
            case.success(let response):
                break
            case.failure(let error):
                print(error)
            }
            
            
        }
    }


}

