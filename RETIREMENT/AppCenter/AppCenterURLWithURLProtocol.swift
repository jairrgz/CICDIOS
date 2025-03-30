//
//  AppCenterURLWithURLProtocol.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 29/03/25.
//

import Foundation

final class AppCenterURLWithURLProtocol: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        return request.url?.host?.contains("appcenter.ms") ?? false
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let _ = URLProtocol.property(forKey: "URLProtocolHandledKey", in: request) {
            return
        }
        
        guard let client = client else { return }
        
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: nil)
        let dataTask = session.dataTask(with: self.request) { data, response, error in
            if let error = error {
                client.urlProtocol(self, didFailWithError: error)
            } else {
                client.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed)
                if let data = data {
                    client.urlProtocol(self, didLoad: data)
                }
            }
            client.urlProtocolDidFinishLoading(self)
        }
        dataTask.resume()
    }
    
    
}

