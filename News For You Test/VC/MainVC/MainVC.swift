//
//  ViewController.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//

import UIKit



class MainVC: UIViewController {
    
     //MARK: - interface connection
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var performSerchBtn: UIButton!
    
    
     //MARK: - let & var general
    
    private var infoForTableView: infoStruct?
    private var selectedNews: Articles?
    private var imageForSelectedNews: UIImage?
    
    private let modelVC = MainVCModel()
    private var curentLangue = S.france
    
    private var menuItems: [UIAction] {
        return [
            UIAction(title: "En Francais \(S.lesPaysAvecFlag[0].flag)", handler: { [weak self] action in
                self?.curentLangue = S.france
                self?.searchField.text = ""
                self?.navigationItem.title = S.lesPaysAvecFlag[0].flag
                self?.performSearch(langue: S.france)
            }),
            UIAction(title: "En Anglais \(S.lesPaysAvecFlag[1].flag)", handler: { [weak self] action in
                self?.curentLangue = S.angl
                self?.searchField.text = ""
                self?.navigationItem.title = S.lesPaysAvecFlag[1].flag
                self?.performSearch(langue: S.angl)
            })
        ]
    }

   private var langueMenue: UIMenu {
        return UIMenu(title: "Langues", image: nil, identifier: nil, options: [], children: menuItems)
    }
    

     //MARK: - viewDid...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSerchBtn.setTitle("", for: .normal)
        // bar button for language change
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Langues", image: nil, primaryAction: nil, menu: langueMenue)
       navigationItem.title = S.lesPaysAvecFlag[0].flag
       performSearch()
        
    }
    
    
     //MARK: - func
    
    func performSearch(option: Int = 0, serchfor: String = "", langue: String = S.france) {
 
        modelVC.fetchInfo(option: option, search: serchfor, langue: langue) { [weak self] in
            self?.infoForTableView = self?.modelVC.fetchedDataToDispay
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }

 

    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == S.segueToExtendedInfoVC {
            let destination = segue.destination as! ExtendedInfoVC
            if let article = selectedNews {
                destination.infoToDispaly = article
                if imageForSelectedNews != nil {
                    destination.imageToDisplay = imageForSelectedNews
                }
            }
            
        }
    }
    
    
     //MARK: - Action func
    
    
    @IBAction func performSearchBtnAction(_ sender: UIButton) {
        if searchField.text?.count ?? 0 > 0 {
            performSearch(option: 1, serchfor: searchField.text!, langue: curentLangue)
            
        }
        view.endEditing(true)
    }
    
    
    
    
}

 //MARK: - Extention TableView

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return infoForTableView?.articles.count ?? 0
    
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: S.CellHomeVC, for: indexPath) as! MainCellVC
       
        if let info = infoForTableView?.articles[indexPath.row] {
            cell.lblTitre.text = info.title!
            if let image = info.urlToImage {
                cell.imageToDisplay.isHidden = false

                    cell.imageToDisplay.imageFromUrl(urlString: image)

            } else {
                cell.imageToDisplay.isHidden = true
            }
        }
   
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
      
        selectedNews = infoForTableView?.articles[indexPath.row]
        if let image = (tableView.cellForRow(at: indexPath) as! MainCellVC).imageToDisplay.image {
            imageForSelectedNews = image
        } else {
            imageForSelectedNews = nil
        }

        
        
        performSegue(withIdentifier: S.segueToExtendedInfoVC, sender: self)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
}

 //MARK: - Extention: SearchBar

extension MainVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchField.text?.count ?? 0 > 0 {
        performSearch(option: 1, serchfor: searchField.text!, langue: curentLangue)
        view.endEditing(true)
        } else {
            return
        }
    }
}

