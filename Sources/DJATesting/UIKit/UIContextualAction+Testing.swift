//
//  UIContextualAction+Testing.swift
//  DJATesting
//
//  Created by Stephen Anthony on 18/01/2022.
//

import UIKit

#if os(iOS)

@available(iOS 11.0, *)
public extension UIContextualAction {
    private typealias HandlerClosure = @convention(block) (UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void
    
    /// Invokes the `handler` closure that the reciever was initialised with.
    func invokeHandler(inSourceView sourceView: UIView = UIView(), actionPerformedHandler: @escaping (Bool) -> Void = { _ in }) {
        // Using key from https://developer.limneos.net/?ios=14.4&framework=UIKitCore.framework&header=UIContextualAction.h
        guard let block = value(forKey: "_handler") else { return }
        let blockPointer = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let actionHandler = unsafeBitCast(blockPointer, to: HandlerClosure.self)
        actionHandler(self, sourceView, actionPerformedHandler)
    }
}

#endif
