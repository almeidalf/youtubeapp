//
//  MessageUtil.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 11/10/20.
//

import Foundation
import UIKit

class MessageUtil {
    
    static func errorAlert(title: String, msg: String, view: UIViewController){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action -> Void in
            view.dismiss(animated: true, completion: nil)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}
