//
//  LoginViewController.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 07.08.2024.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppleSingInButton()
    }
    
    func setUpAppleSingInButton() {
        let signInBtn = ASAuthorizationAppleIDButton()
        signInBtn.frame = CGRect(x: 20, y: UIScreen.main.bounds.size.height - 170, width: (UIScreen.main.bounds.size.width - 40), height: 50)
        
        signInBtn.addTarget(self, action: #selector(loginFunc), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(signInBtn)
    }
    
    @objc func loginFunc() {
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.email, .fullName]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
    }
    
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel))
        present(alert, animated: true)
    }
    
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        <#code#>
//    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
