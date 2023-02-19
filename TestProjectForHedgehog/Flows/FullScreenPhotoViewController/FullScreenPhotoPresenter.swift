//
//  FullScreenPhotoPresenter.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 18.02.2023.
//

import UIKit

protocol FullScreenPhotoViewInput: AnyObject {
    func setupImages(_ urlArray: [String])
    func animationCompleted(direction: DirectionAnimation)
}

protocol FullScreenPhotoViewOutput {
    func setupImages()
    func animationCompleted(direction: DirectionAnimation)
}

final class FullScreenPhotoPresenter {
    
    //MARK: - Properties
    private var images = [Images]()
    private var index = 0
    
    weak var viewController: (UIViewController & FullScreenPhotoViewInput)?

    //MARK: - Init
    
    init(_ images: [Images], index: Int) {
        self.images = images
        self.index = index
    }
}

//MARK: - FullScreenPhotoViewOutput

extension FullScreenPhotoPresenter: FullScreenPhotoViewOutput {
    private func createURLArray(leftIndexImage: Int, centralIndexImage: Int, rightIndexImage: Int) {
        var urlArray = [String]()
        
        urlArray.append(images[leftIndexImage].original)
        urlArray.append(images[centralIndexImage].original)
        urlArray.append(images[rightIndexImage].original)
        
        viewController?.setupImages(urlArray)
    }
    
    func animationCompleted(direction: DirectionAnimation) {
        switch direction {
        case .left:
            index -= 1
            setupImages()
        case .right:
            index += 1
            setupImages()
        }
    }
    
    func setupImages() {
        switch index {
        case -1:
            index = images.endIndex - 1
            createURLArray(leftIndexImage: index - 1, centralIndexImage: index, rightIndexImage: 0)
        case 0:
            createURLArray(leftIndexImage: images.endIndex - 1, centralIndexImage: index, rightIndexImage: index + 1)
        case images.endIndex - 1:
            createURLArray(leftIndexImage: index - 1, centralIndexImage: index, rightIndexImage: 0)
        case images.endIndex:
            index = 0
            createURLArray(leftIndexImage: images.endIndex - 1, centralIndexImage: index, rightIndexImage: index + 1)
        default:
           createURLArray(leftIndexImage: index - 1, centralIndexImage: index, rightIndexImage: index + 1)
        }
    }
}
