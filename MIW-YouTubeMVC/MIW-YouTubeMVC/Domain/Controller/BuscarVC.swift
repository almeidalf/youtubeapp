//
//  BuscarVC.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import UIKit

class BuscarVC: UIViewController {
    
    @IBOutlet weak var txtPesquisa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            self.navigationController?.pushViewController(myVC, animated: true)
        }
        
        let onError = { (err: ErroResponse) -> Void in
            // Loading hide
            Singleton.sharedInstance.stopActivityIndicatory()
            
            MessageUtil.errorAlert(title: "Oops!", msg: err.message ?? "", view: self)
        }
        WS.getPesquisarNome(video: nomeVideo, onSuccess: onSuccess, onError: onError)
    }
    
    
    @IBAction func Buscar(_ sender: Any) {
        pesquisar(nomeVideo: txtPesquisa.text!)
    }
}
