//
//  HomeViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 08/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit
import AuthenticationServices
import GoogleSignIn

class HomeViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        appleButton.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        googleButton.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        facebookButton.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performExistingAccountSetupFlows()
    }
    
    
    
    @IBAction func tapOnFacebookButton(_ sender: Any) {
    }
    
    @IBAction func tapOnAppleButton(_ sender: Any) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @IBAction func tapOnGoogleButton(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func performExistingAccountSetupFlows() {
        let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                        ASAuthorizationPasswordProvider().createRequest()]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(user.userID!)
        }
    }
    
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
        
        print("Sign in presented")
        
    }
    
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
        
        print("Sign in dismissed")
    }
    
}
extension HomeViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let userIdentifier = appleIDCredential.user
            
            do {
                print("user : ", userIdentifier)
            } catch {
                print("Unable to save userIdentifier to keychain.")
            }
            
            let alert = UIAlertController(title: "Apple ID info", message: "user : " + userIdentifier, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            let username = passwordCredential.user
            let password = passwordCredential.password
            DispatchQueue.main.async {
                let message = "The app has received your selected credential from the keychain. \n\n Username: \(username)\n Password: \(password)"
                let alertController = UIAlertController(title: "Keychain Credential Received",
                                                        message: message,
                                                        preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    }
}

extension HomeViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .clear
        layer.cornerRadius = 2
    }
}
