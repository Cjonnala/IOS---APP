//
//  FoodOptionsViewController.swift
//  FinalProject
//
//  Created by Chaitanya on 3/18/24.
//

import UIKit

class FoodOptionsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var quinoaScrollView: UIScrollView!
    @IBOutlet weak var greekYogurtScrollView: UIScrollView!
    @IBOutlet weak var blueberriesScrollView: UIScrollView!
    @IBOutlet weak var chickenBreastScrollView: UIScrollView!
    
    @IBOutlet weak var quinoaTextView: UITextView!
    @IBOutlet weak var greekYogurtTextView: UITextView!
    @IBOutlet weak var blueberriesTextView: UITextView!
    @IBOutlet weak var chickenBreastTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupZooming()
    }

    private func setupZooming() {

        [quinoaScrollView, greekYogurtScrollView, blueberriesScrollView, chickenBreastScrollView].forEach { scrollView in
            scrollView?.delegate = self
            scrollView?.minimumZoomScale = 1.0
            scrollView?.maximumZoomScale = 4.0
            scrollView?.zoomScale = 1.0
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        switch scrollView {
        case quinoaScrollView:
            return quinoaTextView
        case greekYogurtScrollView:
            return greekYogurtTextView
        case blueberriesScrollView:
            return blueberriesTextView
        case chickenBreastScrollView:
            return chickenBreastTextView
        default:
            return nil
        }
    }
}
