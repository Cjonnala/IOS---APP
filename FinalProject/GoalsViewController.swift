//
//  GoalsViewController.swift
//  FinalProject
//
//  Created by Chaitanya on 3/17/24.
//
import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var loseWeightButton: UIButton!
    @IBOutlet weak var maintainWeightButton: UIButton!
    @IBOutlet weak var gainWeightButton: UIButton!
    @IBOutlet weak var gainMuscleButton: UIButton!
    @IBOutlet weak var modifyDietButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    private func configureButtons() {

        let buttons = [loseWeightButton, maintainWeightButton, gainWeightButton, gainMuscleButton, modifyDietButton]
        buttons.forEach { button in
            button?.layer.cornerRadius = 10
            button?.isSelected = false
            button?.backgroundColor = .lightGray // Default color for unselected state
        }
    }
    
    @IBAction func goalButtonTapped(_ sender: UIButton) {

        if (sender == loseWeightButton && gainWeightButton.isSelected) ||
           (sender == gainWeightButton && loseWeightButton.isSelected) {
            showAlert(message: "Please select either Lose Weight or Gain Weight, not both.")
        } else {
            // Toggle the selected state
            sender.isSelected = !sender.isSelected
        }

        updateButtonAppearance(button: sender)
    }
    
    private func updateButtonAppearance(button: UIButton) {
        if button.isSelected {
            // Set color to very light grey when selected
            button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        } else {
            // Set color back to light grey when not selected
            button.backgroundColor = .lightGray
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        navigateToNextScreen()
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Selection Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.loseWeightButton.isSelected = false
            self.gainWeightButton.isSelected = false
            self.updateButtonAppearance(button: self.loseWeightButton)
            self.updateButtonAppearance(button: self.gainWeightButton)
        }))
        present(alert, animated: true)
    }
    
    private func navigateToNextScreen() {

    }
    
}
