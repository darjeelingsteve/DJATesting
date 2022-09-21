//
//  NSObject+ForcedInit.swift
//  DJATesting
//
//  Created by Stephen Anthony on 21/09/2022.
//

import Foundation

public extension NSObject {
    
    /// A workaround for classes whose `init` methods are marked as deprecated
    /// or are made inaccessible.
    /// - Returns: A newly initialised object of the target class.
    static func forcedInit() -> Self {
        Self.self.init()
    }
}
