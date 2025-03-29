//
//  RETIREMENTApp.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 9/02/25.
//

import SwiftUI
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterCrashes

class AppCenterConfiguration: NSObject, URLSessionDelegate {
    static let shared = AppCenterConfiguration()
    let session: URLSession
    
    override private init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration,
                                delegate: nil,
                                delegateQueue: nil)
        super.init()
        // Crear una nueva sesión con el delegate
        let delegateConfiguration = URLSessionConfiguration.default
        let delegateSession = URLSession(configuration: delegateConfiguration,
                                       delegate: self,
                                       delegateQueue: nil)
        URLProtocol.registerClass(AppCenterURLProtocol.self)
    }
}

class AppCenterURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return request.url?.host?.contains("appcenter.ms") ?? false
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let originData = URLProtocol.property(forKey: "URLProtocolHandledKey", in: request) {
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
    
    override func stopLoading() {
        // Nothing to do here
    }
}


@main
struct RETIREMENTApp: App {
    
    init() {
       
        AppCenter.logLevel = .verbose
        AppCenter.start(withAppSecret: "910aa33c-9dec-4e13-91e7-711b0db06443", services:[
            Analytics.self,
            Crashes.self
        ])
        
        Crashes.enabled = true
        
    }
    
    var body: some Scene {
        WindowGroup {
            RetirementCalculatorView()
        }
    }
}
