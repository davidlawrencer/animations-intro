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
    
    lazy var myViewHeightConstraint: NSLayoutConstraint = {
        myView.heightAnchor.constraint(equalToConstant: 200)
    }()

    lazy var myViewWidthConstraint: NSLayoutConstraint = {
        myView.widthAnchor.constraint(equalToConstant: 200)
    }()

    lazy var myViewCenterXConstraint: NSLayoutConstraint = {
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()

    lazy var myViewTopAnchorConstraint: NSLayoutConstraint = {
        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: myViewHeightConstraint.constant)
    }()
    
    @objc func bounceButtonPressed(sender: UIButton) {
        let oldConstant = self.myViewTopAnchorConstraint.constant
        self.myViewTopAnchorConstraint.constant =
            self.view.bounds.maxY - myViewHeightConstraint.constant
        myView.alpha = 1.0
        //use constraints instead of number mathy things
        
        UIView.animate(withDuration: 1.2, delay: 0.4, options: [.autoreverse], animations: {
            self.view.layoutIfNeeded()
            self.myView.alpha = 0.0
        }, completion: { (done) in
            self.myView.alpha = 1.0
            self.myViewTopAnchorConstraint.constant = oldConstant
        })
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
                myViewHeightConstraint,
                myViewWidthConstraint,
                myViewCenterXConstraint,
                myViewTopAnchorConstraint
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
