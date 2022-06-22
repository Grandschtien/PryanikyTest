//
//  NetworkManager.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func loadDataFromNetwork(urlString: String) async throws -> Data
    var url: String { get }
}

final class NetworkManager: NetworkManagerProtocol {
    
    let url = "https://pryaniky.com/static/json/sample.json"
    
    func loadDataFromNetwork(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.notConnectedToInternet)
        }
        
        guard response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
