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
    
    private var timer = Timer()
    
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
        navigationController?.navigationBar.topItem?.title = "Search via Google"
        mainView.configureUI()
        setUpDelegate()
    }
    
    //MARK: - Methods
    
    private func setUpDelegate() {
        guard let collectionAdapter = collectionAdapter else { return }
        mainView.setDelegateCollection(delegate: collectionAdapter)
        mainView.setSearchbarDelegate(delegate: self)
    }
}

//MARK: - SearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainView.startAnimatingActivity()
        self.presenter?.searchPicture(searchText)
    }
}

//MARK: - MainViewInput

extension MainViewController: MainViewInput {
    func reloadCollectionView(with images: [Images]) {
        collectionAdapter?.images = images
        DispatchQueue.main.async {
            self.mainView.stopAnimatingActivity()
            self.mainView.reloadData()
        }
    }
}


