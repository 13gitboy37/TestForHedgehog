//
//  ShowOriginalViewController.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 19.02.2023.
//

import UIKit

final class ShowOriginalViewController: UIViewController {
    
    //MARK: - Properties
    
    private var showOriginalView: ShowOriginalView {
        guard let view = self.view as? ShowOriginalView else {
            let correctView = ShowOriginalView()
            self.view = correctView
            return correctView
        }
        return view
    }


    private var presenter: ShowOriginalOutput?
    
    //MARK: - Init
    
    init(presenter: ShowOriginalOutput?) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = showOriginalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOriginalView.configureUI()
        presenter?.createURLRequest()
    }
}

extension ShowOriginalViewController: ShowOriginalInput {
    func loadWebView(URLRequest: URLRequest) {
        showOriginalView.loadView(URLRequest: URLRequest)
    }
}
