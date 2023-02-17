//
//  MainView.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {

    //MARK: - Propeties
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        return collectionView
    }()
    
    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func configureUI() {
        self.backgroundColor = .white
        
        addSearchBar()
        addCollectionView()
    }
    
    private func addSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func addCollectionView() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
