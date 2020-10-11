//
//  Singleton.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 11/10/20.
//

import Foundation
import UIKit

class Singleton{
    
    static let sharedInstance = Singleton()
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicatory(view: UIView) {
        actInd.center = view.center
        actInd.hidesWhenStopped = true
        actInd.style = UIActivityIndicatorView.Style.whiteLarge
        actInd.color = UIColor.black
        view.addSubview(actInd)
        actInd.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopActivityIndicatory(){
        actInd.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func errorAlert(vc: UIViewController, title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action -> Void in
            vc.dismiss(animated: true, completion: nil)
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
