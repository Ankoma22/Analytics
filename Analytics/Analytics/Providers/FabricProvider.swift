//
//  FabricProvider.swift
//  Analytics
//
//  Created by Andrei Malyhin on 8/1/17.
//  Copyright © 2017 Ankoma Inc. All rights reserved.
//

import Foundation
#if HAS_FABRIC
import Fabric
    
public final class FabricProvider: AnalyticProvider {
    public init(withKitClasses kitClasses: [Any]) {
        Fabric.with(kitClasses)
    }

    public func track(_ event: String, params: [String : Any]?) {
        Answers.logCustomEventWithName(event, customAttributes: params)
    }
    
    public func set(property: String, to: String) {
        Crashlytics.sharedInstance().setObjectValue(to, forKey: property)
    }
}

#endif //HAS_FABRIC
