//
//  ViewController.swift
//  JSONParser
//
//  Created by Jaewook Lim on 2022/09/26.
//

import UIKit

struct Test: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    enum Codingkeys: String, CodingKey {
        case userId, id, title, completed
    }
    
}

class ViewController: UIViewController {
    
    private let jsonManager = JSONManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonManager.parsing(urlString: "https://jsonplaceholder.typicode.com/todos/1", type: Test.self) { result, model in
            if let model = model {
                print(model)
            }
        }
    }
    
}

