//
//  API.swift
//  MadeInWebYouTube
//
//  Created by Reply on 08/10/20.
//

import Foundation

class API {
    static let urlAPI: String = "https://www.googleapis.com/youtube/v3/";
    static let APIKEY: String = "AIzaSyDu09GYr9YCghpMYZwVsxGV7ZdoPVirtzI";
    
    
    static let PROCURAR_VIDEOS: String             = urlAPI + "search?part=id,snippet&q=TERMO_DE_BUSCA&key="+APIKEY+"";
    static let DETALHES_DO_VIDEO: String           = urlAPI + "videos?id=VIDEO_ID&part=snippet,statistics&key="+APIKEY+"";
}
