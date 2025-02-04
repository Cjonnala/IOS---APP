//
//  AboutyouViewController.swift
//  FinalProject
//
//  Created by Chaitanya on 3/17/24.
//

import UIKit

class AboutYouViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var goalWeightTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }

    private func setupTextFieldDelegates() {
        heightTextField?.delegate = self
            weightTextField?.delegate = self
            goalWeightTextField?.delegate = self
            ageTextField?.delegate = self
            countryTextField?.delegate = self
            stateTextField?.delegate = self
            zipCodeTextField?.delegate = self
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case countryTextField:
            if ageTextField.text?.isEmpty ?? true {
                showAlert(message: "Please enter your age")
                return false
            }
        case stateTextField:
            if countryTextField.text?.isEmpty ?? true {
                showAlert(message: "Please enter the country name")
                return false
            }
        case zipCodeTextField:
            if stateTextField.text?.isEmpty ?? true {
                showAlert(message: "Please enter the state")
                return false
            }
        case weightTextField:
            if heightTextField.text?.isEmpty ?? true {
                showAlert(message: "Please enter your height")
                return false
            }
        case goalWeightTextField:
            if weightTextField.text?.isEmpty ?? true {
                showAlert(message: "Please enter your weight")
                return false
            }
        default:
            break
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ageTextField || textField == zipCodeTextField || textField == heightTextField || textField == weightTextField || textField == goalWeightTextField {
            // Ensure only numbers are allowed for Age, ZipCode, Height, Weight, and Goal Weight
            return string.isEmpty || string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        } else if textField == countryTextField || textField == stateTextField {
            // Ensure no numbers are allowed for Country and State
            return string.isEmpty || string.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil
        }
        return true
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Validate inputs before proceeding
        guard let age = ageTextField.text, !age.isEmpty else {
            showAlert(message: "Please enter your age")
            return
        }

        guard let height = heightTextField.text, !height.isEmpty else {
            showAlert(message: "Please enter your height")
            return
        }

        guard let weight = weightTextField.text, !weight.isEmpty else {
            showAlert(message: "Please enter your weight")
            return
        }

        guard let goalWeight = goalWeightTextField.text, !goalWeight.isEmpty else {
            showAlert(message: "Please enter your goal weight")
            return
        }

        guard let country = countryTextField.text, !country.isEmpty, country.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil else {
            showAlert(message: "Please enter a valid country name")
            return
        }

        guard let state = stateTextField.text, !state.isEmpty else {
            showAlert(message: "Please enter the state")
            return
        }

        guard let zipCode = zipCodeTextField.text, !zipCode.isEmpty, zipCode.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            showAlert(message: "Invalid ZIP Code. Enter the correct one")
            return
        }

        // If all validations are passed, perform the segue
        performSegue(withIdentifier: "toNextScreenSegue", sender: nil)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }


}
