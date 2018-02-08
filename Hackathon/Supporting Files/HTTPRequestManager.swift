//
//  HTTPRequestManager.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/5/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SystemConfiguration

class HTTPRequestManager {
    
    typealias SuccessHandler = (JSON) -> Void
    typealias FailureHandler = (String)-> Void
    typealias Parameter = [String: Any]?
    
    let url = ""
    
    private func request(method: HTTPMethod, api: String, parameters: Parameter, header: String, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        
        if !isConnectedToNetwork() {
            error("Нет подключения к интернету")
            return
        }
        
        let APIaddress = "\(url)\(api)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //print(APIaddress)
        
        var head: HTTPHeaders = [:]
        
        
        if let lang = UserDefaults.standard.string(forKey: "language") {
            head.updateValue(lang, forKey: "language")
        } else {
            head.updateValue("ru", forKey: "language")
        }
        
        Alamofire.request(APIaddress!, method: method, parameters: parameters, encoding: JSONEncoding.default , headers: head).responseJSON { (response:DataResponse<Any>) in
            
            guard response.response != nil else {
                error("Не удалось загрузить данные.")
                return
            }
            
            guard let statusCode = response.response?.statusCode else {
                error("Не удалось получить код статуса HTTP")
                return
            }
            
            //            if response.result.isFailure {
            //                if (response.error != nil) {
            //                    if let description = response.error?.localizedDescription  {
            //                        error(description)
            //                    }
            //
            //                } else {
            //                    error("Не удалось загрузить данные. Вероятно, соединение с Интернетом прервано.")
            //                }
            //                return
            //            }
            
            
            print("\(statusCode) - \(api)")
            
//            switch(statusCode) {
//            case HttpStatusCode.unauthorized.statusCode:
//                error("Вам нужно войти, чтобы выполнить это действие")
//                break
//            case HttpStatusCode.ok.statusCode,
//                 HttpStatusCode.accepted.statusCode,
//                 HttpStatusCode.created.statusCode:
//                let json = JSON(data: response.data!)
//                if json["error"].stringValue.isEmpty {
//                    completion(JSON(data: response.data!))
//                    break;
//                }
//                error(json["error"].stringValue)
//                break
//            default:
//
//                let json = JSON(data: response.data!)
//                if !json.isEmpty {
//                    print(json)
//                    let message = json["error"].stringValue
//                    if  message != ""
//                    {
//                        error(message)
//                    } else {
//                        error("Неизвестная ошибка")
//                    }
//                } else {
//                    if let data = response.data {
//                        let json = String(data: data, encoding: String.Encoding.utf8)
//                        error(json!)
//                    } else {
//                        error("")
//                    }
//                }
//            }
        }
    }
    
    
    internal func post(api: String, parameters: Parameter, header: String = "", completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .post, api: api, parameters: parameters, header: header, completion: completion, error: error)
    }
    internal func delete(api: String, parameters: Parameter,header: String = "",  completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .delete, api: api, parameters: parameters, header: header, completion: completion, error: error)
    }
    internal func put(api: String, parameters: Parameter,header: String = "",  completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .put, api: api, parameters: parameters, header: header, completion: completion, error: error)
    }
    internal func get(api: String, header: String = "", completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .get, api: api, parameters: nil, header: header, completion: completion, error: error)
    }
    
    
    
    // MARK: - Internet Connectivity
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
}

