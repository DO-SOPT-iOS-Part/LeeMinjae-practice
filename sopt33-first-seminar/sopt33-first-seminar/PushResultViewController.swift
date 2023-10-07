//
//  ResultViewController.swift
//  sopt33-first-seminar
//
//  Created by 민 on 10/7/23.
//

import UIKit

class PushResultViewController: UIViewController {
    
    // MARK: - Properties
    var delegate: GetDataProtocol?
    
    var email: String = ""
    var password: String = ""
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindText()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - @IBAction Properties
    @IBAction func backButtonTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        delegate?.getLoginData(email: self.email, 
                               password: self.password)
    }
    
    // MARK: - @Functions
    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }
    
    func setLabelText(id: String,
                      password: String) {
        self.email = id
        self.password = password
    }
}
