//
//  NetworkManager.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 19.07.2023.
//

import Foundation
import Combine
final class WebService {


    private func createRequest (route: Route) -> URLRequest? {

        let urlString = route.urlString
        guard let url = urlString.asURL else {return nil}
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = route.method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }

  func getData(route:Route) -> AnyPublisher<ApiResponse, Error> {
    return URLSession.shared.dataTaskPublisher(for: createRequest(route: route)!)
      .map({ $0.data })
      .decode(type: ApiResponse.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

