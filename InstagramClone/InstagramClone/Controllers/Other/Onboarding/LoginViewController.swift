//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Adi on 11/29/22.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginTextField: UITextField = {
        return UITextField()
    }()

    private let passwordTextField: UITextField = {
        return UITextField()
    }()

    private let loginButton: UIButton = {
        return UIButton()
    }()

    private let createAccountButton: UIButton = {
        return UIButton()
    }()

    private let privacyPolicy: UIButton = {
        return UIButton()
    }()

    private let termsAndCondition: UIButton = {
        return UIButton()
    }()

    private let headerView: UIView = {
        return UIView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        addSubviews()
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

    }

    @objc private func didTapTermsButton() {

    }

    @objc private func didTapPrivacyButton() {

    }

    @objc private func didTapCreateAccountButton() {

    }
}
