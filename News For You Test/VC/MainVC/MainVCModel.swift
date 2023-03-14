//
//  MainVCModel.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//


import UIKit

protocol fetcher {
  func fetchInfo(option: Int, search: String, langue: String, completion: @escaping() -> ())
}

final class MainVCModel: fetcher {


    
    var fetchedDataToDispay: infoStruct?
    
    
    
    
    func fetchInfo( option: Int = 0, search: String = "", langue: String, completion: @escaping() -> ()) {
        
        var url: URL?
    
            
            switch option {
            case 0:
                url = URL(string: "https://newsapi.org/v2/top-headlines?language=\(langue)&apiKey=\(S.ApiKey)")
            case 1:
                url = URL(string: "https://newsapi.org/v2/everything?q=\(search)&from=\(Date().dayBeforString)&pageSize=20&language=\(langue)&apiKey=\(S.ApiKey)")
            default:
                return
                
            }
       

        URLSession.shared.dataTask(with: url!) { [weak self] (data, respons, error)  in
            
            if let data = data {

                let jsonDecoder = JSONDecoder()
                
                let finalData = try? jsonDecoder.decode(infoStruct.self, from: data)
                self?.fetchedDataToDispay = finalData

                completion()
            }
           

        }.resume()
        

    }
    
    
    
}
