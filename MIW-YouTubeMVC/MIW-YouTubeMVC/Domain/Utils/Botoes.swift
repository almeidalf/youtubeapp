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
        backButton.title = ""
        view.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let yourBackImage = UIImage(named: "voltar")
        view.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        view.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
}
