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

@available(iOS 13.0, *)
class AuthenticationViewController: UIViewController, GIDSignInDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup View
        setupView()
    }
    
    // MARK: - View Methods
    private func setupView() {
        GIDSignIn.sharedInstance()?.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performExistingAccountSetupFlows()
    }
    
    //MARK: - IBAction
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
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        {
            present(vc, animated: true, completion: nil)
        }
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
@available(iOS 13.0, *)
//MARK: - ASAuthorizationControllerDelegate
extension AuthenticationViewController: ASAuthorizationControllerDelegate {
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

@available(iOS 13.0, *)
//MARK: - ASAuthorizationControllerPresentationContextProviding
extension AuthenticationViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
