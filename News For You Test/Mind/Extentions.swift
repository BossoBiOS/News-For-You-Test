//
//  Extentions.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//

import UIKit

extension UIImageView {
    
    // async image fetch for mainVC tableView from url
     
    func imageFromUrl(urlString: String) {
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
           URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil {
                    if let data = data {

                        DispatchQueue.main.async {
                            if let imageData = data as NSData? {
                                self.image = UIImage(data: imageData as Data)
                                }
                        }
                        

                    }
                }
            }.resume()
            
        }
    }

    
    
    

}



extension Date {
    
    var dayBeforString: String {
        let formater = DateFormatter()
        let dateBefor = Calendar.current.date(byAdding: .day, value: -1, to: self) ?? Date()
        formater.dateFormat = "YYYY-MM-dd"
      return formater.string(from: dateBefor)
    }
}


