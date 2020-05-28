//
//  NoFocusRingTextView.swift
//  testTextView
//
//  Created by James Tang on 27/5/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class NoFocusRingTextView: UITextView {

    var isInside: Bool = false

    #if targetEnvironment(macCatalyst)
    //
    // We're trying to remove the focus ring on macOS in this class.
    // iOS should appear to have no focus ring regardless of this fix.
    //
    // Previously we override and return false in `canBecomeFocused`, that will work but
    // bugs when keyboard navigation is enabled in System > Keyboard preferences.
    // That bug prevents the text view to stay focused while typing, thus causing
    // users not able to add text properly.
    //
    // we use a specific fix for Catalyst apps to remove the focus ring
    // https://stackoverflow.com/questions/57577345/blue-highlighting-focus-ring-on-catalyst-app
    //
    @objc(_focusRingType)
    var focusRingType: UInt {
        return 1 // NSFocusRingTypeNone
    }
    #endif

    @discardableResult override func becomeFirstResponder() -> Bool {
        Swift.print("TTT becomeFirstResponder")
        return super.becomeFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Swift.print("TTT touchesBegan")
        super.touchesBegan(touches, with: event)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        Swift.print("TTT touchesMoved")
        super.touchesMoved(touches, with: event)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
//        Swift.print("TTT hitTest \(point)")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isInside = super.point(inside: point, with: event)
        if self.isInside != isInside {
            Swift.print("TTT becomes \(isInside)")
            self.isInside = isInside
        }
        return isInside
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        let canPerform = super.canPerformAction(action, withSender: sender)
        Swift.print("TTT canPerformAction \(canPerform)")
        return canPerform
    }

    override func touchesShouldCancel(in view: UIView) -> Bool {
        let shouldCancel = super.touchesShouldCancel(in: view)
        Swift.print("TTT shouldCancel \(shouldCancel)")
        return shouldCancel
    }
}
