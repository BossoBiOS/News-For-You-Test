//
//  S.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//


import UIKit

struct S {
    
     //MARK: - static let & var
    
    static let ApiKey = "0d2bc1697a614fd9a046a4dc1183df12"
    
    static let france = "fr"
    static let angl = "en"
    static let segueToExtendedInfoVC = "Segue1"
    static let CellHomeVC = "CellHomeVC"
    
    static let lesPaysAvecFlag: [(name: String, flag: String)] = [(name: "France", flag: "🇫🇷"), (name: "Royaume-Uni", flag: "🇬🇧")]
    
     //MARK: - static func
    
    // create link to url
    static func clicableText(link: String, Tview: UITextView) {
        let titre = "Lien vers article complet"
        let attributedString = NSMutableAttributedString(string: titre)
        let url = URL(string: link)!

        
        attributedString.setAttributes([.link: url], range: NSMakeRange(0, titre.count))
        Tview.attributedText = attributedString
        Tview.isUserInteractionEnabled = true
        Tview.isEditable = false

       
        Tview.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont(name: "HelveticaNeue-MediumItalic", size: 20)!
        ]
    }
    
     // activity spinner perform
//    static func performSpinner(VC: UIViewController) {
//        let child = SpinnerViewController()
//
//        VC.addChild(child)
//        child.view.frame = VC.view.frame
//        VC.view.addSubview(child.view)
//        child.didMove(toParent: VC)
//
//
//        DispatchQueue.main.async {
//
//            child.willMove(toParent: nil)
//            child.view.removeFromSuperview()
//            child.removeFromParent()
//        }
//    }
    
}

