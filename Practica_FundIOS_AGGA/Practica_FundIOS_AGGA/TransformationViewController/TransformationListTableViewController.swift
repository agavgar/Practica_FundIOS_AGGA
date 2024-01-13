//
//  TransformationListTableViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class TransformationListTableViewController: UITableViewController {
    //MARK: - Typealias
    typealias DataSource = UITableViewDiffableDataSource<Int,HeroTransform>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, HeroTransform>
    
        
    //MARK: - Models
    private var transformList: [HeroTransform]
    private var dataSource:DataSource?
    
     //MARK: - Initializer
    init(transformList: [HeroTransform]) {
        self.transformList = transformList
        super.init(nibName: nil, bundle: nil)
        
        tableView.rowHeight = 150
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been iumplemented")
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "DragonBallLogo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: 50, height: 15)
        navigationItem.titleView = imageView
        
        navigationItem.backBarButtonItem?.title = "Detail"
        navigationItem.backBarButtonItem?.tintColor = ColorPalette.customYellow
        
        tableView.register(UINib(nibName: TransformTableViewCell.identifier, bundle: nil),forCellReuseIdentifier: TransformTableViewCell.identifier)
        
        dataSource = DataSource(tableView:tableView) { tableview, indexPath, transform in
            
            guard let cell = tableview.dequeueReusableCell(withIdentifier: TransformTableViewCell.identifier, for: indexPath) as? TransformTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: transform)
            return cell
        }
        
        tableView.dataSource = dataSource
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(transformList)
        dataSource?.apply(snapshot)
    }

   
}

extension TransformationListTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.backgroundColor = ColorPalette.customOrangePressed
        
        guard let transformDetail = dataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        
        let transformDetailSender = TransformationDetailViewController(transformationDetail: transformDetail)
        navigationController?.show(transformDetailSender, sender: nil)
        tableView.cellForRow(at: indexPath)?.backgroundColor = ColorPalette.customOrange
        //transformDetailSender.transformDetail = transformDetail
        
    }
    
}

/*
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
 
 
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
 guard let cell = tableView.dequeueReusableCell(withIdentifier: TransformTableViewCell.identifier, for: indexPath) as? TransformTableViewCell else {
 return UITableViewCell()
 }
 
 let transform = transformList[indexPath.row]
 cell.configure(with: transform)
 return cell
 
 }
 
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
 let transformDetail = transformList[indexPath.row]
 
 let transformDetailSender = TransformationDetailViewController(nibName: "TransformationDetailViewController", bundle: nil)
 transformDetailSender.transformDetail = transformDetail
 navigationController?.pushViewController(transformDetailSender, animated: true)
 
 }
 }
 */
