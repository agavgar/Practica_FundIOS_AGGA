//
//  HeroeCollectionViewController.swift
//  Practica_FundIOS_AGGA
//
//  Created by Alejandro Alberto Gavira García on 25/12/23.
//

import UIKit

final class HeroeCollectionViewController: UICollectionViewController {
    
    //MARK: - Models
    private let collectionHeroes:  [HeroesData] = [.cell,.goku,.vegetta]
    
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
        
        collectionView.register(UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
}

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
        performSegue(withIdentifier: "goToHeroDetail", sender: self)
        // ENVIAR EL HEROE OBJETO
    }
}
