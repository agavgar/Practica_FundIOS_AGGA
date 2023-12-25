//
//  TransformationListTableViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

class TransformationListTableViewController: UITableViewController {
        
    let transformList: [HeroTransformData] = [.goku,.cell,.vegetta]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let cell = UITableViewCell()
        let transformation = transformList[indexPath.row]
        // Forma nueva de configurar una celda por defecto
        var content = cell.defaultContentConfiguration()
        content.text = transformation.title
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "goToTransformsDetail", sender: self)
    }
}
