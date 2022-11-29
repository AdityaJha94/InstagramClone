//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Adi on 11/29/22.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    private struct Constants {
        static let cornerRadius = 8.0
    }

    private let loginTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or email.."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()

    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password.."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()

    private let privacyPolicy: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()

    private let termsAndCondition: UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()

    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundView)
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

        termsAndCondition.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)

        privacyPolicy.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)

        addSubviews()
    }

    override func viewDidLayoutSubviews() {
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3.0)

        loginTextField.frame = CGRect(x: 25, y: headerView.bottom+40, width: view.width-50, height: 52)

        passwordTextField.frame = CGRect(x: 25, y: loginTextField.bottom+10, width: view.width-50, height: 52)

        loginButton.frame = CGRect(x: 25, y: passwordTextField.bottom+10, width: view.width-50, height: 52)

        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom+10, width: view.width-50, height: 52)

        termsAndCondition.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom-100, width: view.width-20, height: 50)

        privacyPolicy.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom-50, width: view.width-20, height: 50)

        configureHeaderView()
    }

    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else { return }

        guard let backgroundView = headerView.subviews.first else {
            return
        }

        backgroundView.frame = headerView.bounds

        // Add Logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)

    }

    private func addSubviews() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(privacyPolicy)
        view.addSubview(termsAndCondition)
        view.addSubview(headerView)
        view.addSubview(createAccountButton)
    }

    @objc private func didTapLoginButton() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        guard let username = loginTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
            return
        }


    }

    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    @objc private func didTapCreateAccountButton() {

    }
}


extension LoginViewController: UITextViewDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            didTapLoginButton()
        }

        return true
    }
}
