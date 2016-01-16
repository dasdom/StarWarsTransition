//
//  ViewController.swift
//  StarWarsTransitioning
//
//  Created by dasdom on 14.01.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .lightGrayColor()
    
    let imageView = UIImageView(image: UIImage(named: "obi_wan"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .ScaleAspectFill
    
    let button = UIButton(type: .System)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Show The Dark Side", forState: .Normal)
    button.addTarget(self, action: "push", forControlEvents: .TouchUpInside)
    button.tintColor = .whiteColor()
    
    view.addSubview(imageView)
    view.addSubview(button)
    
    let views = ["imageView": imageView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|[imageView]|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: [], metrics: nil, views: views)
    layoutConstraints.append(button.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 20))
    layoutConstraints.append(button.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -20))
    layoutConstraints.append(button.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -20))
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }

  func push() {
    navigationController?.pushViewController(SecondViewController(), animated: true)
  }
}

