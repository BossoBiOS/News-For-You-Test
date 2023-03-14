//
//  MainCellVCTableViewCell.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//

import UIKit

class MainCellVC: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var imageToDisplay: UIImageView!
    
    @IBOutlet weak var lblTitre: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func prepareForReuse() {
        lblTitre.text = ""
        imageToDisplay.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
