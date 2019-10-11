//
//  ViewController.swift
//  animations-intro
//
//  Created by David Rifkin on 10/11/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var originalY: CGFloat = 0
    
    lazy var myButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.midX, y: 100, width: 50, height: 50))
        button.setTitle("Press!", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius =  button.frame.width / 2
        return button
    }()
    
    lazy var myView: UIView = {
        let view = UIView(frame: CGRect(x: (self.myButton.frame.minX - myButton.frame.width / 2) , y: self.myButton.frame.minY + 100, width: 100, height: 100))
        view.backgroundColor = .green
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    @objc func buttonPressed(sender: UIButton) {
        UIView.animate(withDuration: 1.2, delay: 0.4, options: [.repeat, .autoreverse ], animations: {
            self.myView.frame.origin.y += (self.view.frame.height - self.myView.frame.height - self.myView.frame.minY)
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(myView)
        self.view.addSubview(myButton)
        originalY = self.myButton.frame.maxY
    }
}
