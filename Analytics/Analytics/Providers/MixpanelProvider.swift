//
//  MixpanelProvider.swift
//  Analytics
//
//  Created by Andrej Malyhin on 7/25/17.
//  Copyright © 2017 Ankoma Inc. All rights reserved.
//

import Foundation
#if HAS_MIXPANEL
import MixpanelAppex

public final class MixpanelProvider: AnalyticsProvider {
    
    public init(withToken token: String) {
        Mixpanel.initialize(token: token)
        
        let mixpanel = Mixpanel.mainInstance()
        mixpanel.identify(distinctId: mixpanel.distinctId)
    }
    
    public func registerForRemoteNotifications(withToken token: Data) {
        Mixpanel.mainInstance().people.addPushDeviceToken(token)
    }
    
    public func track(_ event: String, params: [String : Any]? = nil) {
        if params == nil {
            Mixpanel.mainInstance().track(event: event)
            return
        }
        if let properties = params as? Properties {
            Mixpanel.mainInstance().track(event: event, properties: properties)
        }
    }
    
    public func set(property: String, to: String) {
        Mixpanel.mainInstance().people.set(property: property, to: to)
    }
}
#endif
