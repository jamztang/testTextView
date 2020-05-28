//
//  ViewController.swift
//  testTextView
//
//  Created by James Tang on 27/5/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: ContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        containerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        containerView.textView.text = """
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
    }


}

class ContainerView: UIView {

    var textView = UITextView()

    override func awakeFromNib() {
        textView.frame = self.bounds
        self.addSubview(textView)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if textView.point(inside: point, with: event) {
            return textView
        }
        let view = super.hitTest(point, with: event)
        return view
    }
}
