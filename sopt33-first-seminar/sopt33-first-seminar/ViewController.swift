//
//  ViewController.swift
//  sopt33-first-seminar
//
//  Created by 민 on 10/7/23.
//

import UIKit

class ViewController: UIViewController, GetDataProtocol {
    
    // MARK: - Properties
    private var idText: String = ""
    private var passwordText: String = ""
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var loginDescriptionLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    @IBAction func loginButtonPushTap(_ sender: Any) {
        pushToResultVC()
    }
    
    @IBAction func loginButtonPresentTap(_ sender: Any) {
        presentToResultVC()
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK: - @Functions
    func pushToResultVC() {
        guard let pushResultVC = self.storyboard?.instantiateViewController(withIdentifier: "PushResultViewController") as? PushResultViewController else {return}

        pushResultVC.setLabelText(id: self.idText,
                                  password: self.passwordText)
        pushResultVC.delegate = self
        self.navigationController?.pushViewController(pushResultVC, animated: true)
    }
    
    func presentToResultVC() {
        guard let presentResultVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentResultViewController") as? PresentResultViewController else {return}
        self.present(presentResultVC, animated: true)
    }
}

// MARK: - @Extensions
extension ViewController {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
