//
//  JSONManager.swift
//  JSONParser
//
//  Created by Jaewook Lim on 2022/09/26.
//

import Foundation

import Alamofire

// MARK: - How To Use

/*
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
 */

open class JSONManager {
    public static let shared = JSONManager()
    
    func parsing<T: Codable>(urlString: String, type: T.Type, completion: @escaping (Bool, T?) -> Void){
        guard let url = URL(string: urlString) else {
            completion(false, nil)
            return
        }
        
        AF.request(url)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: T.self) { AFResponse in
                if let data = AFResponse.value {
                    completion(true, data)
                }
        }
    }

}
