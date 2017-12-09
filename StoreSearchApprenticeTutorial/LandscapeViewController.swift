//
//  LandscapeViewController.swift
//  StoreSearchApprenticeTutorial
//
//  Created by Anatoliy Chernyuk on 12/5/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class LandscapeViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    deinit {
        //print("deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.removeConstraints(view.constraints)
        view.translatesAutoresizingMaskIntoConstraints = true
        scrollView.removeConstraints(scrollView.constraints)
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        pageControl.removeConstraints(pageControl.constraints)
        pageControl.translatesAutoresizingMaskIntoConstraints = true
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "LandscapeBackground")!)
        scrollView.contentSize = CGSize(width: 1000, height: 1000)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.frame = view.bounds
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - pageControl.frame.size.height, width: view.frame.size.width, height: pageControl.frame.size.height)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
