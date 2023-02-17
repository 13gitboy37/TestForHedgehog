//
//  ViewController.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 15.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    private var mainView: MainView {
        guard let view = self.view as? MainView else {
            let correctView = MainView()
            self.view = correctView
            return correctView
        }
        return view
    }
    
    private var presenter: MainViewOutput?
    private var collectionAdapter: MainCollectionAdapter?
    
    
    //MARK: - Init
    
    init(presenter: MainViewOutput?, adapter: MainCollectionAdapter?) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.collectionAdapter = adapter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        mainView.configureUI()
        mainView.collectionView.dataSource = collectionAdapter
        mainView.collectionView.delegate = collectionAdapter
        presenter?.getImages("Git")
    }
}

//MARK: - MainViewInput

extension MainViewController: MainViewInput {
    func reloadCollectionView(with images: [Images]) {
        collectionAdapter?.images = images
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }
}


