//
//  BuscarVC.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import UIKit

class BuscarVC: UIViewController {
    
    @IBOutlet weak var txtPesquisa: UITextField!
    @IBOutlet weak var imgMIW: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }
    
    public func pesquisar(nomeVideo: String){
        Singleton.sharedInstance.showActivityIndicatory(view: self.view)
        let onSuccess = { (item: ListaDeBuscaYouTube) -> Void  in
            Singleton.sharedInstance.stopActivityIndicatory()
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "goToListVideos") as! ListaVideosVC
            myVC.dados = item
            self.slideUp(vc: myVC)
        }
        
        let onError = { (err: ErroResponse) -> Void in
            // Loading hide
            Singleton.sharedInstance.stopActivityIndicatory()
            
            MessageUtil.errorAlert(title: "Oops!", msg: err.message ?? "", view: self)
        }
        WS.getPesquisarNome(video: nomeVideo, onSuccess: onSuccess, onError: onError)
    }
    
    func slideUp(vc: UIViewController){
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func Buscar(_ sender: Any) {
        if txtPesquisa.text?.count != 0 {
            pesquisar(nomeVideo: txtPesquisa.text!)
        }else{
            MessageUtil.errorAlert(title: "Oops!", msg: "Por favor, digite algo no campo de pesquisa!", view: self)
        }
    }
}
