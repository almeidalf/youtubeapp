//
//  ListaDeBuscaYouTube.swift
//  MadeInWebYouTube
//
//  Created by Reply on 08/10/20.
//

import Foundation
import ObjectMapper

class ListaDeBuscaYouTube : Mappable {
    var items: [Fragmento] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}

class Fragmento : Mappable {
    var snippet: Detalhes?
    var id: VideoId?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        snippet <- map["snippet"]
        id <- map["id"]
    }
}

class VideoId : Mappable {
    var videoId: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        videoId <- map["videoId"]
    }
}


class Detalhes : Mappable {
    var publishedAt: String?
    var title: String?
    var description: String?
    var thumbnails: Thumbnails?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        publishedAt <- map["publishedAt"]
        title <- map["title"]
        description <- map["description"]
        thumbnails <- map["thumbnails"]
    }
}

class Thumbnails : Mappable {
    var def: Default?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        def <- map["default"]
    }
}

class Default : Mappable {
    var url: String?
    var width: String?
    var height: String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
