//
//  TransformationListTableViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class TransformationListTableViewController: UITableViewController {
        
    //MARK: - Models
    let transformList: [HeroTransformData] = [.goku,.cell,.vegetta]
    
    
    //MARK: - Initializers
    /*
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    @available(*,unavailable)
    required init? (coder: NSCoder){
        fatalError("init (coder:) has not been implemented")
    }
    
     */
     
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: TransformTableViewCell.identifier, bundle: nil),forCellReuseIdentifier: TransformTableViewCell.identifier)
        
    }

   
}

// MARK: - TableView DataSource
extension TransformationListTableViewController {
    override func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return transformList.count
    }
}

// MARK: - TableView Delegate
extension TransformationListTableViewController {
    
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransformTableViewCell.identifier, for: indexPath) as? TransformTableViewCell else {
            return UITableViewCell()
        }
        
        //let cell = UITableViewCell()
        let transformation = transformList[indexPath.row]
        // Forma nueva de configurar una celda por defecto
        cell.configure(with: transformation)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "goToTransformsDetail", sender: self)
    }
}
