//
//  TableViewCell.swift
//  Assets
//
//  Created by Muneera Y on 22/10/1443 AH.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lastname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
