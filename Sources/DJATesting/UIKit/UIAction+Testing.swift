//
//  UIAction+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 27/05/2021.
//

#if !os(watchOS)

import UIKit

@available(iOS 13.0, tvOS 13.0, *)
public extension UIAction {
    private typealias ActionHandler = @convention(block) (UIAction) -> Void
    
    /// Invokes the `handler` closure that the reciever was initialised with.
    func invokeHandler() {
        // Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=UIAction.h
        guard let block = value(forKey: "handler") else { return }
        let blockPointer = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let actionHandler = unsafeBitCast(blockPointer, to: ActionHandler.self)
        actionHandler(self)
    }
}

#endif
