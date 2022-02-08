//
//  LoginViewController.swift
//  NXT-LoginModule
//
//  Created by Shyam Kumar on 07/02/22.
//

import UIKit

public class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var signUpContentLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    var viewModel = LoginViewModel()
    var isLoggedin:((Bool) -> Void)?
    public var image = UIImage()
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        self.continueButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    @objc public func loginAction(completionHandler: @escaping (Bool) -> Void) {
        viewModel.loginAction(username: emailTextField.text!, Password: passwordTextField.text!, completion: ({[weak self] success in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                if success {
                    self?.isLoggedin?(success)
                } else {
                    self?.isLoggedin?(success)
                }
            }
        }))
    }
    @IBAction func signUpAction(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "Login", bundle: Bundle(identifier: "com.module.sample.NXT-LoginModule")).instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        self.present(sb, animated: true, completion: nil)
    }
}
