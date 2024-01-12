//
//  HeroeCollectionViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class HeroeCollectionViewController: UICollectionViewController {
    //MARK: - Typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Int, HeroDragonBall>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, HeroDragonBall>
    
    //MARK: - Models
    private let model = NetworkModel.shared
    private var dataSource: DataSource?
    //private var collectionHeroes: [HeroDragonBall] = []
    
    //MARK: - Initializers
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 175)
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        
        collectionView.contentInset.left = 16
        collectionView.contentInset.right = 16
    }
    
    @available(*,unavailable)
    required init? (coder: NSCoder){
        fatalError("init (coder:) has not been implemented")
    }
    
     
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registration = UICollectionView.CellRegistration<CustomCollectionViewCell, HeroDragonBall>( cellNib: UINib(
            nibName: CustomCollectionViewCell.identifier,
            bundle: nil)) { cell, _, hero in
                
                cell.configure(with: hero)
                
            }
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, hero in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: hero)
        }
        
        collectionView.dataSource = dataSource
        
        model.getHeroes { [weak self] result in
            switch result{
            case let .success(hero):
                
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems(hero)
                self?.dataSource?.apply(snapshot)
/*
                self?.collectionHeroes = listadoHeroes
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                print(listadoHeroes)
 */
                break

            case let .failure(error):
                print(error)
            }
            
        }
        /*
        collectionView.register(UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
         */
    }
}

extension HeroeCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let heroSelected = dataSource?.itemIdentifier(for: indexPath) else { return }
        
        model.getTransformation(id:heroSelected.id) { [weak self] result in
            switch result{
            case let .success(listadoTransform):
                
                DispatchQueue.main.async {
                    let heroDetailViewController = HeroDetailViewController(hero:heroSelected,transform:listadoTransform)
                    self?.navigationController?.show(heroDetailViewController, sender: nil)
                    
                    //let heroDetailSender = HeroDetailViewController(nibName: "HeroDetailViewController", bundle: nil)
                    //heroDetailSender.heroDetail = heroSelected
                    //heroDetailSender.heroTransformation = listadoTransform
                    //self?.navigationController?.pushViewController(heroDetailSender, animated: true)
                }
                
                break
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
}

/*
//MARK: - CollectionView DataSource
extension HeroeCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionHeroes.count
    }
}

//MARK: - CollectionView Delegate

extension HeroeCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let heroe = collectionHeroes[indexPath.row]
        cell.configure(with: heroe)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let heroeSelected = collectionHeroes[indexPath.row]
        
        model.getTransformation(id:heroeSelected.id) { [weak self] result in
            switch result{
            case let .success(listadoTransform):
                DispatchQueue.main.async {
                    let heroDetailSender = HeroDetailViewController(nibName: "HeroDetailViewController", bundle: nil)
                    heroDetailSender.heroDetail = heroeSelected
                    heroDetailSender.heroTransformation = listadoTransform
                    self?.navigationController?.pushViewController(heroDetailSender, animated: true)
                }
                break
            case let .failure(error):
                print(error)
            }
        }
        
        
        
        
        
    }
}
*/
