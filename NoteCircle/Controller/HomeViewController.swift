//
//  HomeViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 15/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthenticationViewController") as? AuthenticationViewController
        {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
}
