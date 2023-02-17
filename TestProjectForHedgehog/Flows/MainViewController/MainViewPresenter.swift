//
//  MainViewPresenter.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import Foundation
import UIKit

protocol MainViewInput {
    func reloadCollectionView(with images: [Images])
}

protocol MainViewOutput {
    func getImages(_ searchText: String) 
}

final class MainPresenter {
    weak var viewController: (UIViewController & MainViewInput)?
    private var networkService: NetworkService?
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

//MARK: - MainViewInput

extension MainPresenter: MainViewOutput {
    func getImages(_ searchText: String) {
        Task {
            do {
                let images = await networkService?.fetchImages(searchText)
                viewController?.reloadCollectionView(with: images ?? [])
            }
        }
    }
}
