//
//  ShowOriginalView.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 19.02.2023.
//

import UIKit
import SnapKit
import WebKit

final class ShowOriginalView: UIView {
    
    //MARK: - Properties
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    } ()

    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func addWebView() {
        self.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureUI() {
        addWebView()
    }
    
    func loadView(URLRequest: URLRequest) {
        webView.load(URLRequest)
    }
}
