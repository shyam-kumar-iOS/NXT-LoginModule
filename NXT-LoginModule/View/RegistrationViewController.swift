//
//  RegistrationViewController.swift
//  NXT-LoginModule
//
//  Created by Shyam Kumar on 08/02/22.
//

import UIKit

public class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    var isRegistered:((Bool) -> Void)?
    var viewModel = LoginViewModel()
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.continueButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    
    @objc public func registerAction() {
        viewModel.registerAction(username: emailTextField.text!, Password: passwordTextField.text!, name: nameTextField.text!, completion: ({[weak self] success in
            if success {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                    if success {
                        self?.isRegistered?(success)
                        self?.dismiss(animated: true, completion: nil)
                    } else {
                        self?.isRegistered?(success)
                    }
                })
            }
        }))
    }
}
