//
//  UIAlertAction+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 27/05/2021.
//

import UIKit

public extension UIAlertAction {
    private typealias ActionHandler = @convention(block) (UIAlertAction) -> Void

    /// Invokes the `handler` closure that the reciever was initialised with.
    func invokeHandler() {
        // Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=UIAlertAction.h
        guard let block = value(forKey: "handler") else { return }
        let blockPointer = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let actionHandler = unsafeBitCast(blockPointer, to: ActionHandler.self)
        actionHandler(self)
    }
}
