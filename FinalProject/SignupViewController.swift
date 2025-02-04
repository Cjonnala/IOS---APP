//
//  SignupViewController.swift
//  FinalProject
//
//  Created by Chaitanya on 3/17/24.
//
import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFieldDelegates()
    }

    private func setupUI() {
        signupButton.layer.cornerRadius = 10
    }

    private func setupTextFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == lastNameTextField && (firstNameTextField.text?.isEmpty ?? true) {
            showAlert(message: "Please enter your first name")
            return false
        } else if textField == emailTextField && (lastNameTextField.text?.isEmpty ?? true) {
            showAlert(message: "Please enter your last name")
            return false
        } else if textField == passwordTextField && !isValidEmail(emailTextField.text ?? "") {
            showAlert(message: "Please enter a valid email address")
            return false
        } else if textField == confirmPasswordTextField && !isValidPassword(passwordTextField.text ?? "") {
            showAlert(message: "Password must contain at least one uppercase letter, one number, and one special character")
            return false
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField && !isValidPassword(passwordTextField.text ?? "") {
            showAlert(message: "Password must contain at least one uppercase letter, one number, and one special character")
        } else if textField == confirmPasswordTextField && confirmPasswordTextField.text != passwordTextField.text {
            showAlert(message: "Passwords did not match")
        }
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        if validateFields() {
            performSegue(withIdentifier: "showGoals", sender: nil)
            
        }
    }


    private func validateFields() -> Bool {
        if let firstName = firstNameTextField.text, firstName.isEmpty {
            showAlert(message: "Please enter your first name")
            return false
        }
        
        if let lastName = lastNameTextField.text, lastName.isEmpty {
            showAlert(message: "Please enter your last name")
            return false
        }
        
        if let email = emailTextField.text, !isValidEmail(email) {
            showAlert(message: "Please enter a valid email address")
            return false
        }
        
        if let password = passwordTextField.text, !isValidPassword(password) {
            showAlert(message: "Password must contain at least one uppercase letter, one number, and one special character")
            return false
        }
        
        if confirmPasswordTextField.text != passwordTextField.text {
            showAlert(message: "Passwords did not match")
            return false
        }
        
        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*]).{8,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

    private func navigateToNextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let goalViewController = storyboard.instantiateViewController(withIdentifier: "GoalsViewController") as? GoalsViewController {
            navigationController?.pushViewController(goalViewController, animated: true)
        }
    }
}
