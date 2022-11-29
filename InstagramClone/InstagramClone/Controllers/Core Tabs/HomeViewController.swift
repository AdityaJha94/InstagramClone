//
//  ViewController.swift
//  InstagramClone
//
//  Created by Adi on 11/29/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
handleNotAuthenticated()

    }

    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            // Show Login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        }
    }


}

