//
//  ViewController.swift
//  animations-intro
//
//  Created by David Rifkin on 10/11/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var bounceButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.setTitle("Drop", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(bounceButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius =  button.frame.width / 2
        return button
    }()
    
    lazy var myView: UIView = { [unowned self] in
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    lazy var myViewHeightConstaint: NSLayoutConstraint = {
        myView.heightAnchor.constraint(equalToConstant: 200)
    }()

    lazy var myViewWidthConstraint: NSLayoutConstraint = {
        myView.widthAnchor.constraint(equalToConstant: 200)
    }()

    lazy var myViewCenterXConstraint: NSLayoutConstraint = {
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()

    lazy var myViewCenterYConstraint: NSLayoutConstraint = {
        myView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    @objc func bounceButtonPressed(sender: UIButton) {
        //use constraints instead of number mathy things
        UIView.animate(withDuration: 1.2, delay: 0.4, options: [.repeat, .autoreverse ], animations: {
            self.myView.frame.origin.y += (self.view.frame.height - self.myView.frame.height - self.myView.frame.minY)
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(myView)
        self.view.addSubview(bounceButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        configureMyViewConstraints()
        constrainDropButton()
    }
    
    private func configureMyViewConstraints() {
        myView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
                myViewHeightConstaint,
                myViewWidthConstraint,
                myViewCenterXConstraint,
                myViewCenterYConstraint
           ])
    }
    
    private func constrainDropButton() {
        bounceButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            bounceButton.heightAnchor.constraint(equalToConstant: 50),
            bounceButton.widthAnchor.constraint(equalToConstant: 50),
            bounceButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bounceButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -300)
            ])
    }
}
