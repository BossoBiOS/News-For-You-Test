//
//  ExtendedInfoVC.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//

import UIKit

class ExtendedInfoVC: UIViewController {
    
     //MARK: - interface connection
    
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var lblTitre: UILabel!
    @IBOutlet weak var lblArticle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
     //MARK: - let & var general
    
    var infoToDispaly: Articles?
    var imageToDisplay: UIImage?
    
 //MARK: - viewDid...
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupView()
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        infoToDispaly =  nil
        imageToDisplay = nil
    }
    
    
     //MARK: - func
    
    func setupView() {
        if let image = imageToDisplay {
                    imageViewContainer.isHidden = false
                    imageView.isHidden = false
                    imageView.image = image
                    
                } else {
                    imageViewContainer.isHidden = true
                    imageView.isHidden = true
                }
        
        if let info = infoToDispaly {
            lblTitre.text = info.title
            lblArticle.text = "\(info.content ?? "") Date: \(info.publishedAt ?? "")"
            if let url = info.url {
                S.clicableText(link: url, Tview: textView)
                   }
        }
    }
    


}
