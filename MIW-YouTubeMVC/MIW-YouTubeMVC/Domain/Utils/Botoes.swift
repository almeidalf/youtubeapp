//
//  Botoes.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 11/10/20.
//

import Foundation
import UIKit

class Botoes {
    
    static func voltar(view: UIViewController){
        let backButton = UIBarButtonItem()
        backButton.title = "Voltar"
        view.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let imagemVoltar = UIImage(named: "voltar")
        view.navigationController?.navigationBar.backIndicatorImage = imagemVoltar
        view.navigationController?.navigationBar.backIndicatorTransitionMaskImage = imagemVoltar
        
    }
    
    static func imagemCentro(view: UIViewController){
        let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 220, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 220, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "madeinweb")
        imageView.image = image
        imageContainer.addSubview(imageView)
        view.navigationItem.titleView = imageContainer
    }
}
