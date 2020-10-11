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
    
    
    public func pesquisar(nomeVideo: String){
        let onSuccess = { (item: ListaDeBuscaYouTube) -> Void  in
                    let myVC = self.storyboard?.instantiateViewController(withIdentifier: "goToListVideos") as! ListaVideosVC
                    myVC.dados = item
                    self.navigationController?.pushViewController(myVC, animated: true)
                }
                
                let onError = { (item: ErroResponse) -> Void in
                    // Loading hide
                }
                WS.getPesquisarVideos(buscar: nomeVideo, onSuccess: onSuccess, onError: onError)
    }


    @IBAction func Buscar(_ sender: Any) {
        pesquisar(nomeVideo: txtPesquisa.text!)
    }
}
