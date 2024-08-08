//
//  Auth.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 06.08.2024.
//

import Foundation
import LocalAuthentication
import AuthenticationServices

class Auth: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    static let shared = Auth()
    
    var userImageView: UIImageView?
    var userNameLabel: UILabel?
    
    static func auth() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Biometric authorize"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        print("Fail face id")
                        return
                    }
                    // Если биометрическая аутентификация успешна, выполняем авторизацию Apple ID
                    Auth.shared.performAppleIDAuthorization()
                }
            }
        }
    }
    
    func performAppleIDAuthorization() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            if let givenName = fullName?.givenName, let familyName = fullName?.familyName {
                userNameLabel?.text = "\(givenName) \(familyName)"
            }
            
            // Получение аватарки пользователя
            // Здесь вы можете добавить код для загрузки аватарки пользователя
            // Например, используя URL или другой метод
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Обработка ошибок
        print("Authorization failed: \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
}
