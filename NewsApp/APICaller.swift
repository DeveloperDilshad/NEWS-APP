//
//  APICaller.swift
//  NewsApp
//
//  Created by Dilshad P on 19/11/24.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadLinesURL = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7499be8083c6444a82f078233bd62bfc")
    }
    
    private init(){
        
    }
    
    public func getTopStories(completion: @escaping(Result<[Article],Error>)->Void){
        guard let url = Constants.topHeadLinesURL else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            if let error = error{
                completion(.failure(error))
            }else if let data = data{
                
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                    print("Articles:\(result.articles.count)")
                    
                }catch{
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}


//Models

struct APIResponse:Codable{
    let articles:[Article]
}

struct Article:Codable{
    let source:Source
    let title:String
    let description:String?
    let url:String?
    let urlToImage:String?
    let publishedAt:String?
}

struct Source:Codable{
    let name: String
}
