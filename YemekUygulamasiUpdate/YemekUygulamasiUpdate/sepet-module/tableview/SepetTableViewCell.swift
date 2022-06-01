//
//  SepetTableViewCell.swift
//  YemekUygulamasiUpdate
//
//  Created by Nursema Nakiboğlu on 31.05.2022.
//

import UIKit
//CacoaTouchClass //UITableViewCell

class SepetTableViewCell: UITableViewCell
{
    @IBOutlet weak var sepetImageView: UIImageView!
    @IBOutlet weak var sepetYemekAdLabel: UILabel!
    @IBOutlet weak var sepetFiyatLabel: UILabel!
    @IBOutlet weak var sepetAdetLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
