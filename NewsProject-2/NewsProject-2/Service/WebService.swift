//
//  WebService.swift
//  NewsProject-2
//
//  Created by Enes Koç on 29.11.2024.
//
import Foundation

class WebService {
    
    func getNews(url : URL , completion : @escaping ([News]?) -> () ){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                completion(nil)
                
            }else if let data = data{
                
               let newsArrive = try? JSONDecoder().decode([News].self, from: data)
                
                if let newsArrive = newsArrive{
                    completion(newsArrive)
                }
                
            }
            
            
        }.resume()
        
    }
    
}
