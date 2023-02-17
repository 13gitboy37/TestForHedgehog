//
//  MainViewAssembly.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import Foundation
import UIKit

enum AppBuilder {
    static func mainViewController() -> UIViewController & MainViewInput {
        let networkService = NetworkService()
        let presenter = MainPresenter(networkService: networkService)
        let adapter = MainCollectionAdapter()
        let viewController = MainViewController(presenter: presenter, adapter: adapter)
        presenter.viewController = viewController
        
        return viewController
    }
}
