//
//  ShowOriginalPresenter.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 19.02.2023.
//

import Foundation

protocol ShowOriginalInput: AnyObject {
    func loadWebView(URLRequest: URLRequest)
}

protocol ShowOriginalOutput {
    func createURLRequest()
}

final class ShowOriginalPresenter {
    weak var viewController: ShowOriginalInput?
    
    private var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
    }
}

extension ShowOriginalPresenter: ShowOriginalOutput {
    func createURLRequest() {
        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else { return }
        
        let urlRequest = URLRequest(url: url)
        
        viewController?.loadWebView(URLRequest: urlRequest)
    }
}
