import Foundation
import UIKit

enum AppBuilder {
    static func mainViewController() -> UIViewController & MainViewInput {
        let networkService = NetworkService()
        let presenter = MainPresenter(networkService: networkService)
        let adapter = MainCollectionAdapter()
        adapter.presenter = presenter
        let viewController = MainViewController(presenter: presenter, adapter: adapter)
        presenter.viewController = viewController
        
        return viewController
    }
    
    static func fullScreenPhotoViewController(_ images: [Images], index: Int) -> UIViewController {
        let presenter = FullScreenPhotoPresenter(images, index: index)
        let viewController = FullScreenPhotoViewController(presenter: presenter)
        presenter.viewController = viewController
        
        return viewController
    }
}
