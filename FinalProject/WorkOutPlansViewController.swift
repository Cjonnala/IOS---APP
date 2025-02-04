//
//  WorkOutPlansViewController.swift
//  FinalProject
//
//  Created by Chaitanya on 3/17/24.
//

import UIKit

class WorkOutPlansViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var hiitScrollView: UIScrollView!
    @IBOutlet weak var strengthTrainingScrollView: UIScrollView!
    @IBOutlet weak var crossfitScrollView: UIScrollView!
    @IBOutlet weak var hiitTextView: UITextView!
    @IBOutlet weak var strengthTrainingTextView: UITextView!
    @IBOutlet weak var crossfitTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupZooming()
    }

    private func setupZooming() {
        hiitScrollView.delegate = self
        strengthTrainingScrollView.delegate = self
        crossfitScrollView.delegate = self
        hiitScrollView.minimumZoomScale = 1.0
        hiitScrollView.maximumZoomScale = 4.0
        strengthTrainingScrollView.minimumZoomScale = 1.0
        strengthTrainingScrollView.maximumZoomScale = 4.0
        crossfitScrollView.minimumZoomScale = 1.0
        crossfitScrollView.maximumZoomScale = 4.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        switch scrollView {
        case hiitScrollView:
            return hiitTextView
        case strengthTrainingScrollView:
            return strengthTrainingTextView
        case crossfitScrollView:
            return crossfitTextView
        default:
            return nil
        }
    }

}
