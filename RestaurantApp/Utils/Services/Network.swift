//
//  Network.swift
//  RestaurantApp
//
//  Created by The Ngoc on 2022/10/12.
//

import Alamofire

enum NetworkError: Error {
    case urlError
    case requestError(errorCode: Int, message: String?)
    case networkError(error: AFError)
    case dataNull
    case parseObjectError
}

class NetworkHelper {
        
    // MARK: - POST METHOD
    static func get<T: Codable>(_ urlPath: String,
                                 parameters: [String: Any] = [:],
                                 responseType: T.Type,
                                 completionHandler: @escaping (_ response: T) -> Void,
                                 errorHandler: @escaping (_ error: NetworkError) -> Void) {
        
        sendRequest(urlPath,
                    method: .get,
                    parameters: parameters,
                    responseType: responseType,
                    completionHandler: completionHandler,
                    errorHandler: errorHandler)
    }
    
    // MARK: - SEND REQUEST
    private static func sendRequest<T: Codable>(_ urlPath: String,
                                                method: HTTPMethod,
                                                parameters: [String: Any] = [:],
                                                responseType: T.Type,
                                                completionHandler: @escaping (_ response: T) -> Void,
                                                errorHandler: @escaping (_ error: NetworkError) -> Void) {
        let request = AF.request(urlPath,
                                 method: method,
                                 parameters: parameters)
        
        request
            .validate(statusCode: 200..<300)
            .responseData { response in
                self.handleResponse(response: response, completionHandler: completionHandler, errorHandler: errorHandler)
            }
    }
    
    // MARK: - HANDLE RESPONSE
    private static func handleResponse<T: Codable>(response: AFDataResponse<Data>,
                                           completionHandler: (_ response: T) -> Void,
                                           errorHandler: (_ error: NetworkError) -> Void) {
        switch response.result {
        case .success(let data):
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(decodedData)
            } catch let err {
#if DEBUG
                print(
                    """
                    ===================== RequestError =====================
                    \(String(describing: err))
                    =====================     End      =====================
                    """
                )
#else
#endif
                errorHandler(.parseObjectError)
            }
        case .failure(let error):
            errorHandler(.networkError(error: error))
        }
    }
}
