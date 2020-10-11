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
    @IBOutlet weak var lblDescricao: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitulo.text = dados.items?.first?.snippet?.title
        if let visualizacoes = dados.items?.first?.statistics?.viewCount {
        lblVisualizacoes.text = "\(visualizacoes) Visualizações"
        }
        lblLikes.text = dados.items?.first?.statistics?.likeCount
        lblDislikes.text = dados.items?.first?.statistics?.dislikeCount
        lblDescricao.text = dados.items?.first?.snippet?.description
    }
    
    
}
