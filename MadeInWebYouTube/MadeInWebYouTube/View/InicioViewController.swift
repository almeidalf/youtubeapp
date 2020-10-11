//
//  InicioViewController.swift
//  MadeInWebYouTube
//
//  Created by Reply on 09/10/20.
//

import UIKit

class InicioViewController: UIViewController {
    var inicioVM = InicioViewModel()

    @IBOutlet weak var txtPesquisar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Buscar(_ sender: Any) {
        inicioVM.realizarBusca(video: txtPesquisar.text!)
    }
}
