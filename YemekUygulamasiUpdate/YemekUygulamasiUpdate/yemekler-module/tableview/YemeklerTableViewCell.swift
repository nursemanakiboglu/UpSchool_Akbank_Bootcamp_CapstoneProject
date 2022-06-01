//
//  YemeklerTableViewCell.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import UIKit
//CacoaTouchClass //UITableViewCell

class YemeklerTableViewCell: UITableViewCell
{

   
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var hucreArkaplan: UIView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
