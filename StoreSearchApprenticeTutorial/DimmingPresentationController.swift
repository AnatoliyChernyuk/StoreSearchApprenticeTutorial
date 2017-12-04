//
//  DimmingPresentationController.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 12/2/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    lazy var dimmingView = GradientView(frame: CGRect.zero)
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        containerView!.insertSubview(dimmingView, at: 0)
        dimmingView.alpha = 0.0
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: {_ in self.dimmingView.alpha = 1}, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: {_ in self.dimmingView.alpha = 0}, completion: nil)
        }
    }
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
}
