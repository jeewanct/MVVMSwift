//
//  HTTPClient.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import UIKit

class HTTPClient{
    typealias HTTPResponse<T: Codable> = (Result<BaseResponseModel<T>, HTTPError>) -> Void
    private var shared: URLSessionProtocol = URLSession.shared
    init(_ sessionProtocol: URLSessionProtocol = URLSession.shared) {
        shared = sessionProtocol
            
          //  Constants.isSSLPinningEnable ? URLSession(configuration: .ephemeral, delegate: NSURLSessionPinningDelegate(), delegateQueue: nil) : URLSession.shared
    }
    
    func request<T: Codable>(request: RequestProtocol, completion: @escaping HTTPResponse<T>){
        let performRequest = request.request()
        shared.dataTask(with: performRequest) { (data, response, error) in
            if let unwrappedError = error{
                let httpError = HTTPError(unwrappedError.localizedDescription)
                DispatchQueue.main.async {
                    completion(.failure(httpError))
                }
            }
            if let _ = response {
                do{
                    let jsonResponse = try JSONDecoder().decode(BaseResponseModel<T>.self, from: data ?? Data())
                    DispatchQueue.main.async {
                        completion(.success(jsonResponse))
                    }
                }catch let error{
                    var httpError: HTTPError
                    if error is HTTPError{
                        httpError = error as! HTTPError
                    }else{
                        httpError = HTTPError(error.localizedDescription)
                    }
                    DispatchQueue.main.async {
                        completion(.failure(httpError))
                    }
                }
            }else{
            }
        }.resume()
    }
}
