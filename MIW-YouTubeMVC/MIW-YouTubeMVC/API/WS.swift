//
//  WS.swift
//  MadeInWebYouTube
//
//  Created by Reply on 08/10/20.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class WS {
    
    class func getPesquisarNome(video:String, onSuccess: @escaping (_ status: ListaDeBuscaYouTube) -> Void, onError: @escaping (_ status: ErroResponse) -> Void ){
        //HTTPHeaders
        let url = (API.PROCURAR_VIDEOS as NSString).replacingOccurrences(of: "TERMO_DE_BUSCA", with: video)

        if let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let urlEncoded = URL(string: encoded){
        AF.request(urlEncoded, method: .get, encoding: JSONEncoding.default)
            .responseObject {(response: AFDataResponse<ListaDeBuscaYouTube>) in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do{
                        onSuccess(data)
                    }
                }
            }
        }
    }
        
        class func getDetalhes(videoId:String, onSuccess: @escaping (_ status: DetalhesDoVideoResponse) -> Void, onError: @escaping (_ status: ErroResponse) -> Void ){
            //HTTPHeaders
            let url = (API.DETALHES_DO_VIDEO as NSString).replacingOccurrences(of: "VIDEO_ID", with: videoId)
            print(url)
            AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseObject {(response: AFDataResponse<DetalhesDoVideoResponse>) in
                    if (response.response?.statusCode == 200){
                        if let valor = response.value{
                            onSuccess(valor)
                        }else {
                            let errorResponse = ErroResponse()
                            onError(errorResponse)
                        }
                    }
                    
                }
        }
        
    }
