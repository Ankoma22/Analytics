//
//  Analytics.swift
//  Analytics
//
//  Created by Andrej Malyhin on 7/25/17.
//  Copyright © 2017 Ankoma Inc. All rights reserved.
//

import Foundation

public enum Provider {
    case mixpanel
    case amplitude
}

public final class Analytics {
    
    public static let shared = Analytics()
    
    fileprivate var providers: [AnalyticProvider] = []
    
    public func setup(withAnalyticsProviders providers: [Provider: String]) {
        for (provider, token) in providers {
            switch provider {
            case .mixpanel: setupMixpanel(token)
            case .amplitude: setupAmplitude(token)
            }
        }
    }
    
    public func registerForRemoteNotifications(withToken token: Data) {
        providers.forEach { provider in
            provider.registerForRemoteNotifications(withToken: token)
        }
    }
    
    public func track(_ event: String, params: [String: Any]? = nil) {
        providers.forEach { provider in
            provider.track(event, params: params)
        }
    }
    
    public func set(property: String, to: String) {
        providers.forEach { provider in
            provider.set(property: property, to: to)
        }
    }
    
    fileprivate func setupMixpanel(_ token: String) {
#if HAS_MIXPANEL
        let mixpanelProvider = MixpanelProvider(withToken: token)
        providers.append(mixpanelProvider)
#endif
    }
    
    fileprivate func setupAmplitude(_ token: String) {
#if HAS_AMPLITUDE
        let amplitudeProvider = AmplitudeProvider(withToken: token)
        providers.append(amplitudeProvider)
#endif
    }
}
