//
//  ListaVideosVC.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import UIKit

class ListaVideosVC: UIViewController, UITableViewDelegate{
    
    var dados: ListaDeBuscaYouTube = ListaDeBuscaYouTube()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupTableView()
        
    }
    
    public func visualizarDetalhes(videoId: String){
        Singleton.sharedInstance.showActivityIndicatory(view: self.view)
        let onSuccess = { (item: DetalhesDoVideoResponse) -> Void  in
            Singleton.sharedInstance.stopActivityIndicatory()
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "goToDetalhesVideo") as! DetalhesVideo
            myVC.dados = item
            self.navigationController?.pushViewController(myVC, animated: true)
        }
        
        let onError = { (item: ErroResponse) -> Void in
            // Loading hide
            Singleton.sharedInstance.stopActivityIndicatory()
        }
        WS.getDetalhes(videoId: videoId, onSuccess: onSuccess, onError: onError)
    }
    
    private func setupTableView(){
        let nib = UINib(nibName: "InfoVideoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InfoCell")
        self.tableView.rowHeight = 80.0
    }
}

//MARK: - EXTENSION
extension ListaVideosVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : InfoVideoCell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoVideoCell
        
        cell.tituloCell.text = dados.items[indexPath.row].snippet?.title
        cell.descricaoCell.text = dados.items[indexPath.row].snippet?.description
        
        //Config para aparecer img na thumb
        if let urlImagem = dados.items[indexPath.row].snippet?.thumbnails?.def?.url{
            let url = URL(string: urlImagem)!
            let data = try? Data(contentsOf: url)
            cell.imagemCell.image = UIImage(data: data!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = dados.items[indexPath.row].id?.videoId {
            visualizarDetalhes(videoId: id)
        }
    }
}
