//
//  AnalyticProvider.swift
//  Analytics
//
//  Created by Andrej Malyhin on 7/25/17.
//  Copyright © 2017 Ankoma Inc. All rights reserved.
//

import Foundation

public protocol AnalyticProvider {
    func registerForRemoteNotifications(withToken deviceToken:Data)
    func track(_ event: String, params: [String : Any]?)
    func set(property: String, to: String)
}

extension AnalyticProvider {
    public func registerForRemoteNotifications(withToken deviceToken:Data) {}
}
