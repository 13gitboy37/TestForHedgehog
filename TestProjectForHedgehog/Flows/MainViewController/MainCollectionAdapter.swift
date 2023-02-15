//
//  MainCollectionAdapter.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import UIKit

final class MainCollectionAdapter: NSObject {
    
    //MARK: - Properties
    
}

//MARK: - DataSource

extension MainCollectionAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId,
                                                          for: indexPath) as? CollectionViewCell
        else { return UICollectionViewCell() }
        
        return cell
    }
}

//MARK: - Delegate 

extension MainCollectionAdapter: UICollectionViewDelegate {
    
}

//MARK: - Delegate Flow Layout

extension MainCollectionAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth(for: collectionView.frame.width,
                                       spacing: Layout.spacing),
                      height: (collectionView.frame.size.width / 3))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: Layout.spacing,
                            left: Layout.spacing,
                            bottom: Layout.spacing,
                            right: Layout.spacing)
    }
}

extension MainCollectionAdapter {
    private enum Layout {
        static let spacing: CGFloat = 5
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 3
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return finalWidth - 5.0
    }
}
