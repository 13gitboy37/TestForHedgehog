//
//  NetworkService.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 16.02.2023.
//

import Foundation

final class NetworkService {
    
    lazy var mySession = URLSession(configuration: configuration)
    
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        return config
    }()
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "serpapi.com"
        return constructor
    }()
    
    private let apiKey = "03ea6a8dc0c729a806b085ae7465c5120115aaa50872cb96e8d881a9fc33690a"
    
    func fetchImages(_ searchText: String) async -> [Images] {
        urlConstructor.path = "/search.json"
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "tbm", value: "isch"),
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        guard
            let url = urlConstructor.url
        else {
            print(APIRequestError.badUrl)
            return []
        }
        
        do {
            let (data, _) = try await mySession.data(from: url)
            let images = try JSONDecoder().decode(ImagesResults.self, from: data).images
            return images
        } catch {
            print(APIRequestError.noData)
            return []
        }
    }
}
