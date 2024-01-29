//
//  APIHelper.swift
//  Schools
//
//  Created by Kiran Kumar on 29/01/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case badStatus
    case none
}

class APIHelper: ObservableObject {
    static let sharedInstance = APIHelper()
    @Published var apiError = NetworkError.none
    func donwloadData<T: Codable>(from urlString: String) async -> T? {
        do {
            guard let url = URL(string: urlString) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.badResponse }
            return decodedResponse
        } catch (let error) {
            apiError = error as! NetworkError
            return error as? T
        }
    }
}
