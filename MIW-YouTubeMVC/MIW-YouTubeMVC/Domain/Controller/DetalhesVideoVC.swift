//
//  DetalhesVideoVC.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 11/10/20.
//

import UIKit

class DetalhesVideo: UIViewController {
    
    var dados = DetalhesDoVideoResponse()
    
    @IBOutlet weak var imgDetalhes: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblVisualizacoes: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var lblDislikes: UILabel!
    @IBOutlet weak var txtDescricao: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preencherDados()
        Botoes.voltar(view: self)
    }
    
    func preencherDados(){
        if let urlImagem = dados.items?.first?.snippet?.thumbDetalhes?.stand?.url{
            let url = URL(string: urlImagem)!
            let data = try? Data(contentsOf: url)
            imgDetalhes.image = UIImage(data: data!)
        }
        
        lblTitulo.text = dados.items?.first?.snippet?.title
        if let visualizacoes = dados.items?.first?.statistics?.viewCount {
            lblVisualizacoes.text = "\(visualizacoes) Visualizações"
        }
        lblLikes.text = dados.items?.first?.statistics?.likeCount
        lblDislikes.text = dados.items?.first?.statistics?.dislikeCount
        txtDescricao.text = dados.items?.first?.snippet?.description
    }
    
}
