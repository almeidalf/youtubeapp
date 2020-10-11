//
//  DetalhesDoVideoResponse.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 10/10/20.
//

import Foundation
import ObjectMapper

class DetalhesDoVideoResponse : Mappable {
    var items: [SnippetStatistics]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}

class SnippetStatistics : Mappable {
    var snippet: FragmentoDetalhes?
    var statistics: ItensStatistcs?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        snippet <- map["snippet"]
        statistics <- map["statistics"]
    }
}

class ThumbnailsDetalhes : Mappable {
    var stand: DefaultDetalhes?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        stand <- map["standard"]
    }
}

class DefaultDetalhes : Mappable {
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

class FragmentoDetalhes : Mappable {
    var thumbDetalhes: ThumbnailsDetalhes?
    var title: String?
    var description: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        thumbDetalhes <- map["thumbnails"]
        title <- map["title"]
        description <- map["description"]
    }
}

class ItensStatistcs : Mappable {
    var viewCount: String?
    var likeCount: String?
    var dislikeCount: String?
    var commentCount: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        viewCount <- map["viewCount"]
        likeCount <- map["likeCount"]
        dislikeCount <- map["dislikeCount"]
        commentCount <- map["commentCount"]
    }
}
