//
//  AppCenterConfiguration.swift
//  RETIREMENT
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 29/03/25.
//


import Foundation

final class AppCenterConfiguration: NSObject, URLSessionDelegate {
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
        let _ = URLSession(configuration: delegateConfiguration,
                                       delegate: self,
                                       delegateQueue: nil)
        URLProtocol.registerClass(AppCenterURLWithURLProtocol.self)
    }
}

