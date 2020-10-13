//
//  ListaVideosVC.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import UIKit

class ListaVideosVC: UIViewController, UITableViewDelegate{
    
    var dados: ListaDeBuscaYouTube = ListaDeBuscaYouTube()
    var searchList : ListaDeBuscaYouTube = ListaDeBuscaYouTube()
    var searching: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupTableView()
        Botoes.voltar(view: self)
        Botoes.imagemCentro(view: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false
    }
    
    public func visualizarDetalhes(videoId: String){
        Singleton.sharedInstance.showActivityIndicatory(view: self.view)
        let onSuccess = { (item: DetalhesDoVideoResponse) -> Void  in
            Singleton.sharedInstance.stopActivityIndicatory()
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "goToDetalhesVideo") as! DetalhesVideo
            myVC.dados = item
            self.slideDown(vc: myVC)
        }
        
        let onError = { (err: ErroResponse) -> Void in
            // Loading hide
            Singleton.sharedInstance.stopActivityIndicatory()
            
            MessageUtil.errorAlert(title: "Oops!", msg: err.message ?? "", view: self)
        }
        WS.getDetalhes(videoId: videoId, onSuccess: onSuccess, onError: onError)
    }
    
    private func setupTableView(){
        let nib = UINib(nibName: "InfoVideoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InfoCell")
        self.tableView.rowHeight = 80.0
    }
    
    func slideDown(vc: UIViewController){
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: true)
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
