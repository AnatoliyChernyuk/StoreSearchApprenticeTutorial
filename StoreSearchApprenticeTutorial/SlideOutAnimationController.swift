//
//  SlideOutAnimationController.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 12/4/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class SlideOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.view(forKey: .from) {
            let containerView = transitionContext.containerView
            let duration = transitionDuration(using: transitionContext)
            UIView.animate(withDuration: duration, animations: {
                fromView.center.y -= containerView.bounds.size.height
                fromView.center.x += containerView.bounds.size.width
                fromView.transform = CGAffineTransform(rotationAngle: -9.3)
                //fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: {
                finished in
                transitionContext.completeTransition(finished)
            })
        }
    }
}
