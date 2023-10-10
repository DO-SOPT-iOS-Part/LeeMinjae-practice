//
//  ViewController.swift
//  sopt33-first-seminar
//
//  Created by 민 on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var idText: String = ""
    private var passwordText: String = ""
    
    private var isPush: Bool = true
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var loginDescriptionLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pushPresentSegmentedControl: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUIComponents()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let idText = textField.text {
            self.idText = idText
        }
    }

    @IBAction func pwTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func segControlChanged(_ sender: Any) {
        switch pushPresentSegmentedControl.selectedSegmentIndex {
        case 0: isPush = true
        case 1: isPush = false
        default: return
        }
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        if isPush {
            pushToResultVC()
        } else {
            presentToResultVC()
        }
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK: - @Functions
    func pushToResultVC() {
        guard let pushResultVC = self.storyboard?.instantiateViewController(withIdentifier: "PushResultViewController") as? PushResultViewController else {return}
        
        pushResultVC.setLabelText(id: self.idText,
                                  password: self.passwordText)
        // Delegate Pattern 사용
        pushResultVC.delegate = self
        // Closure 사용
        pushResultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
        self.navigationController?.pushViewController(pushResultVC, animated: true)
    }
    
    func presentToResultVC() {
        guard let presentResultVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentResultViewController") as? PresentResultViewController else {return}
        self.present(presentResultVC, animated: true)
    }
    
    func setUIComponents() {
        idTextField.placeholder = "아이디를 입력해주세요"
        idTextField.backgroundColor = .systemGray6
        idTextField.clearButtonMode = .whileEditing

        pwTextField.placeholder = "비밀번호를 입력해주세요"
        pwTextField.backgroundColor = .systemGray6
        pwTextField.clearButtonMode = .whileEditing
        pwTextField.isSecureTextEntry = true
        
        loginButton.backgroundColor = .systemGray
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 10
    }
}

// MARK: - @Extensions
extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("델리게이트로 받아온 email : \(email), 델리게이트로 받아온 password : \(password)")
    }
}
