//
//  DHStarWarsTransition.swift
//  StarWarsTransitioning
//
//  Created by dasdom on 14.01.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class DHStarWarsTransition: NSObject, UIViewControllerAnimatedTransitioning {
  
  var operation: UINavigationControllerOperation = .Push

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
    let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    
    guard let containerView = transitionContext.containerView() else { fatalError() }
    
    containerView.addSubview(fromViewController.view)
    containerView.addSubview(toViewController.view)
    
    if operation == .Pop {
      containerView.bringSubviewToFront(fromViewController.view)
    }
    
    let toView = toViewController.view
    toView.setNeedsLayout()
    toView.layoutIfNeeded()
    UIGraphicsBeginImageContext(fromViewController.view.frame.size)
    toView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    let toSnapshotImage = UIGraphicsGetImageFromCurrentImageContext()
    
    let frame = fromViewController.view.frame
    let toSnapshotImageView = UIImageView(image: toSnapshotImage)
    let toHostView = UIView(frame: frame)
    toHostView.addSubview(toSnapshotImageView)
    toHostView.clipsToBounds = true
    containerView.addSubview(toHostView)
    
    toViewController.view.alpha = 0
    if operation == .Push {
      toSnapshotImageView.frame = CGRect(x: -frame.size.width, y: 0 ,width: frame.size.width, height: frame.size.height)
      toHostView.frame = CGRect(x: frame.size.width, y: 0, width: frame.size.width, height: frame.size.height)
    } else {
      toSnapshotImageView.frame = frame
      toHostView.frame = CGRect(x: 0, y: 0, width: 0, height: frame.size.height)
    }
    
    UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveLinear, animations: { () -> Void in
        toViewController.view.frame = frame
        toHostView.frame = frame
        toSnapshotImageView.frame = frame
      }) { (_) -> Void in
        toHostView.removeFromSuperview()
        containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 1

        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
    }
  }
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.4
  }
}

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
  
  let customTransition = DHStarWarsTransition()
  
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    customTransition.operation = operation
    return customTransition
  }
}
