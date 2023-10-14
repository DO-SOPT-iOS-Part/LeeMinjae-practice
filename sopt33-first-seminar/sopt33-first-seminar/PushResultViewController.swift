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
    var loginDataCompletion: (([String]) -> Void)? // 스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    
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
        
        // Delegate 사용
        delegate?.getLoginData(email: self.email,
                               password: self.password)
        
        // Closure 사용
        guard let loginDataCompletion else { return }
        loginDataCompletion([self.email, self.password])
        
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
