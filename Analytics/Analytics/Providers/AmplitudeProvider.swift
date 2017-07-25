//
//  AmplitudeProvider.swift
//  Analytics
//
//  Created by Andrej Malyhin on 7/25/17.
//  Copyright © 2017 Ankoma Inc. All rights reserved.
//

import Foundation
#if AMPLITUDE
import Amplitude_iOS

public final class AmplitudeProvider: AnalyticsProvider {
    
    public init(withToken token: String) {
        Amplitude.instance().initializeApiKey(token)
        Amplitude.instance().setUserId(nil)
        Amplitude.instance().regenerateDeviceId()
    }
    
    public func track(_ event: String, params: [String : Any]? = nil) {
        if params == nil {
            Amplitude.instance().logEvent(event)
            return
        }
        Amplitude.instance().logEvent(event, withEventProperties: params)
    }
    
    public func set(property: String, to: String) {
        Amplitude.instance().setUserProperties([property : to])
    }
}
#endif
