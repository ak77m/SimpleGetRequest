//
//  TableViewCell.swift
//  SimpleGetRequest
//
//  Created by ak77m on 20.02.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var textBodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
