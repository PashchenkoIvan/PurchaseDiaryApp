//
//  BiometricAuthenticator.swift
//  PurchaseDiaryApp
//
//  Created by Пащенко Иван on 14.08.2024.
//

import LocalAuthentication

class BiometricAuthenticator {
    static func isBiometricAuthenticationAvailable() -> Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    static func authenticateWithBiometrics(reason: String, completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            DispatchQueue.main.async {
                if success {
                    // Биометрическая аутентификация успешна
                    completion(true)
                } else {
                    // Ошибка аутентификации
                    completion(false)
                }
            }
        }
    }
}
