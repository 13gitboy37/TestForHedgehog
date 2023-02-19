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
    func searchPicture(_ searchText: String)
}

final class MainPresenter {
   
    //MARK: - Properties
    
    private var networkService: NetworkService?
    private var timer = Timer()
    
    weak var viewController: (UIViewController & MainViewInput)?
    
    //MARK: - Init
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    //MARK: - Methods
    
    private func getImages(_ searchText: String) {
        Task {
            do {
                let images = await networkService?.fetchImages(searchText)
                viewController?.reloadCollectionView(with: images ?? [])
            }
        }
    }
}

//MARK: - MainViewInput

extension MainPresenter: MainViewOutput {
    func searchPicture(_ searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
            self?.getImages(searchText)
        })
    }
}

extension MainPresenter: MainCollectionAdapterOutput {
    func goToFullScreen(_ images: [Images], index: Int) {
            viewController?.navigationController?.pushViewController(AppBuilder.fullScreenPhotoViewController(images,
                                                                                                   index: index),
                                                          animated: true)
    }
}
