//
//  MainVCModelTest.swift
//  News For You TestTests
//
//  Created by Stefan kund on 13/03/2023.
//
@testable import News_For_You_Test

import XCTest

final class MainVCModelTest: XCTestCase {
    
    var mainVCModel: MainVCModel!

    override func setUp() {
        super.setUp()
        mainVCModel = MainVCModel()
    }
    
    override func tearDown() {
        super.tearDown()
        mainVCModel = nil
    }
    
    
    func test_json_decode_data() throws {
      let json = """
        {
            "status": "ok",
            "totalResults": 3,
            "articles": [
                {
                    "source": {
                        "id": "usa-today",
                        "name": "USA Today"
                    },
                    "author": "Clare Mulroy",
                    "title": "What is the healthiest fruit? This one is packed with nutrients. - USA TODAY",
                    "description": "There isn't just one fruit that is healthier than others, but one fruit stands out with increased fiber, antioxidants and cognitive benefits.",
                    "url": "https://www.usatoday.com/story/life/2023/03/12/what-is-the-healthiest-fruit/11383241002/",
                    "urlToImage": "https://www.gannett-cdn.com/-mm-/b2b05a4ab25f4fca0316459e1c7404c537a89702/c=0-0-1365-768/local/-/media/2021/08/09/USATODAY/usatsports/gettyimages-529677122.jpg?width=1365&height=768&fit=crop&format=pjpg&auto=webp",
                    "publishedAt": "2023-03-12T11:00:25Z",
                    "content": "An apple a day keeps the doctor away, right?  We grew up hearing the cliched expression, but do you know how much fruit you should actually be eating per day? The recommended intake depends on a num… [+5034 chars]"
                }
            ]
        }
        """
        let jsonDecoder = JSONDecoder()
        let jsonData = json.data(using: .utf8)!
        let finalData = try? jsonDecoder.decode(infoStruct.self, from: jsonData)
        
        XCTAssertEqual("What is the healthiest fruit? This one is packed with nutrients. - USA TODAY", finalData?.articles[0].title)
        XCTAssertEqual("https://www.usatoday.com/story/life/2023/03/12/what-is-the-healthiest-fruit/11383241002/", finalData?.articles[0].url)
        
    }
    
    
    func test_json_form_JSONFile() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "JsonResponse", ofType: "json") else {fatalError()}
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else {fatalError()}
        let jsonData = json.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        let finalData = try? jsonDecoder.decode(infoStruct.self, from: jsonData)
        
        XCTAssertEqual(finalData?.articles.count, 3)
        
    }
    
    
}
