//
//  NetworkingManager.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-07-12.
//

import Foundation
import Combine

class NetworkingManager {

    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown

        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "[🔥🔥🔥🔥🔥🔥🔥🔥] \n Bad response from URL: \n \(url) \n [🔥🔥🔥🔥🔥🔥🔥🔥]."
            case .unknown:
                return "[⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️] \n Unknown Error occured \n [⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️]."
            }
        }
    }

    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return  URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // converts it to Any Publisher
    }

    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error is: \n \(error.localizedDescription)")
        }
    }
}
