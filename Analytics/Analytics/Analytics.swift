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
    case fabric
}

public struct ProviderInfo {
    let provider: Provider
    let token: String?
    let classes: [Any]?
    
    init(provider: Provider, token: String? = nil, classes: [Any]? = nil) {
        self.provider = provider
        self.token = token
        self.classes = classes
    }
}

public final class Analytics {
    
    public static let shared = Analytics()
    
    fileprivate var providers: [AnalyticProvider] = []
    
    public func setup(withAnalyticsProviders providers: [ProviderInfo]) {
        for info in providers {
            switch info.provider {
            case .mixpanel: setupMixpanel(info.token!)
            case .amplitude: setupAmplitude(info.token!)
            case .fabric: setupFabric(info.classes!)
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
#endif//HAS_MIXPANEL
    }
    
    fileprivate func setupAmplitude(_ token: String) {
#if HAS_AMPLITUDE
        let amplitudeProvider = AmplitudeProvider(withToken: token)
        providers.append(amplitudeProvider)
#endif//HAS_AMPLITUDE
    }
    
    fileprivate func setupFabric(_ kitClasses: [Any]) {
#if HAS_FABRIC
    let fabricProvider = FabricProvider(withKitClasses: kitClasses)
    providers.append(fabricProvider)
#endif//HAS_FABRIC
    }
}
