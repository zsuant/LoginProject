//
//  ViewController.swift
//  LoginProject
//
//  Created by 이수겸 on 2022/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1419738829, green: 0.1541982889, blue: 0.1706750095, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private var emailTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none// 앞글자 자동 대문자
        tf.autocorrectionType = .no// 틀린글자 자동 바꾸기
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1419738829, green: 0.1541982889, blue: 0.1706750095, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(ViewController.self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        
        return button
    }()
    
    private let passwordResetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        
        return st
    }()
     
    //텍스트필드, 로그인 버틑 높이 설정
    private let textviewHeight: CGFloat = 48
    
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)


    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        
        view.backgroundColor = UIColor.black
        
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false // 자동 오토레이아웃 끄기
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: textviewHeight*3 + 36),
            
            
                                     emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
                                     emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
                                     emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
                                     emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
                                     
                                     emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
                                     emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
                                     //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
                                     emailInfoLabelCenterYConstraint,
                                    
                                     passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
                                     passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
                                     passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
                                     passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
                                     
                                     passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
                                     passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
                                     //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
                                     passwordInfoLabelCenterYConstraint,
                                     
                                     passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
                                     passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
                                     passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
                                     
                                     passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
                                     passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     passwordResetButton.heightAnchor.constraint(equalToConstant: textviewHeight)])
    }
    
    @objc func passwordSecureModeSetting() {
        
        passwordTextField.isSecureTextEntry.toggle()
        
    }
    
    @objc func resetButtonTapped() {
        
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼 눌림")
        
            
        }
        let cancel = UIAlertAction(title: "취소", style: .default) { action in
        
            print("취소버튼 눌림")

        }
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            emailInfoLabelCenterYConstraint.constant = -13
        }
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
            
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded() //에니메이션을 자연스럽게
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
            emailInfoLabelCenterYConstraint.constant = 0
        }
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
            passwordInfoLabelCenterYConstraint.constant = 0

        }
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
}
