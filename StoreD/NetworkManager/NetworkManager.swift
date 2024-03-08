//
//  NetworkManager.swift
//  StoreD
//
//  Created by Andrew on 04.03.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func getRockets() async throws -> [RocketDTO]
} 

class NetworkManager: NetworkManagerProtocol {

    let baseURL = "https://api.spacexdata.com"

    func getRockets() async throws -> [RocketDTO] {
        guard let url = URL(string: baseURL + "/v4/rockets") else { throw NetworkManagerError.invalidURL }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkManagerError.fetchDataError }
        let decodedRockets = try JSONDecoder().decode([RocketDTO].self, from: data)
//        print(decodedRockets)
        return decodedRockets
    }
}

enum NetworkManagerError: Error {
    case invalidURL
    case fetchDataError
}
