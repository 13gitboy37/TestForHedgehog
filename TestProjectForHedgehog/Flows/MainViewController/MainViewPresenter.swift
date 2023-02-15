//
//  MainViewPresenter.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import Foundation
import UIKit

protocol MainViewInput {
    
}

protocol MainViewOutput {
    
}

final class MainPresenter {
    weak var viewController: (UIViewController & MainViewInput)?
}

//MARK: - MainViewInput

extension MainPresenter: MainViewOutput {
    
}
