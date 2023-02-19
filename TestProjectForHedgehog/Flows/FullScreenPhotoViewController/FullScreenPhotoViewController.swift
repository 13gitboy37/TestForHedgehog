//
//  FullScreenPhotoViewController.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 18.02.2023.
//

import UIKit

final class FullScreenPhotoViewController: UIViewController {
    
    //MARK: - Properties
    
    private var fullScreenPhotoView: FullScreenPhotosView {
        guard let view = self.view as? FullScreenPhotosView else {
            let correctView = FullScreenPhotosView()
            self.view = correctView
            return correctView
        }
        return view
    }

    private var presenter: FullScreenPhotoViewOutput?
    
    //MARK: - Init
    
    init(presenter: FullScreenPhotoViewOutput?) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        fullScreenPhotoView.viewController = self
        self.view = fullScreenPhotoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        fullScreenPhotoView.configureUI()
        presenter?.setupImages()
    }
}

//MARK: - FullScreenPhotoViewInput

extension FullScreenPhotoViewController: FullScreenPhotoViewInput {
    func setupImages(_ urlArray: [String]) {
        fullScreenPhotoView.setupPhoto(urlArray)
    }
    
    func animationCompleted(direction: DirectionAnimation) {
        presenter?.animationCompleted(direction: direction)
    }
    
    func goOriginal() {
        presenter?.getLinkOriginal()
    }
}
