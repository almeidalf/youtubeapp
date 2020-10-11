//
//  ErroResponse.swift
//  MadeInWebYouTube
//
//  Created by Reply on 08/10/20.
//

import Foundation
import ObjectMapper

class ErroResponse: Mappable {
    var readyState : Int?
    var responseText : String?
    var status : Int?
    var statusText : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        readyState <- map["readyState"]
        responseText <- map["responseText"]
        status <- map["status"]
        statusText <- map["statusText"]
    }
}
