//
//  InfoVideoCell.swift
//  MIW-YouTubeMVC
//
//  Created by Reply on 09/10/20.
//

import UIKit

class InfoVideoCell: UITableViewCell {
    
    @IBOutlet weak var imagemCell: UIImageView!
    @IBOutlet weak var tituloCell: UILabel!
    @IBOutlet weak var descricaoCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
