//
//  KisilerHucreTableViewCell.swift
//  KisilerApp
//
//  Created by Omer Keskin on 7.05.2024.
//

import UIKit

class KisilerHucreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelKisiAd: UILabel!
    @IBOutlet weak var labelKisiTel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
