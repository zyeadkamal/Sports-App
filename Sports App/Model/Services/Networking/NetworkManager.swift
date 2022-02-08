//
//  NetworkManager.swift
//  Sports App
//
//  Created by mac on 2/2/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //MARK: - properties
     private let baseURL = "https://www.thesportsdb.com/api/v1/json/2/"
     //private let key     = "/k_gfvq4g4f"
    
    //MARK: - HttpMethod
    func request<T: Decodable>(fromEndpoint: EndPoint, httpMethod: HTTPMethod = .get,parametrs : [String:String] , completion: @escaping (Swift.Result<T, Error>) -> Void) {
        
        let completionOnMain: (Swift.Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        guard let url = URL(string: "\(baseURL)\(fromEndpoint.rawValue)") else {
            completionOnMain(.failure(Errors.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
    
        
        Alamofire.request(url, method: httpMethod, parameters: parametrs, encoding: URLEncoding(destination: .queryString), headers: nil).responseJSON { (response) in
           
        
            if let error = response.error {
                completionOnMain(.failure(error))
                return
            }
            
            guard let urlResponse = response.response else {
                return completionOnMain(.failure(Errors.invalidResponse))
            }
            
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(Errors.invalidStatusCode))
            }
            
            guard let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(response))
            } catch {
                debugPrint("Could not translate the data to the requested type. Reason: \(error.localizedDescription)")
                completionOnMain(.failure(error))
            }
        }
    }
}

