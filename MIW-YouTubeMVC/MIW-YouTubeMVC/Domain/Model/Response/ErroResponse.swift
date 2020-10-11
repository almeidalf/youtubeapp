//
//  ErroResponse.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import Foundation
import ObjectMapper

class ErroResponse : Mappable {
    var error: String?
    var code: Int?
    var message: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        code <- map["code"]
        message <- map["message"]
    }
}
