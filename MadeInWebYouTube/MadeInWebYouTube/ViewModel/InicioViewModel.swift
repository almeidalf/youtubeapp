//
//  InicioViewModel.swift
//  MadeInWebYouTube
//
//  Created by Reply on 09/10/20.
//

import Foundation
import Alamofire
import UIKit


class InicioViewModel {
    
    func realizarBusca(video:String){
                
            let onSuccess = { (item: ListaDeBuscaYouTube) -> Void  in()
    
            }
            
            let onError = { (item: ErroResponse) -> Void in
                // Loading hide
            }
        WS.getPesquisarVideos(buscar: video, onSuccess: onSuccess, onError: onError)
}
    
}
