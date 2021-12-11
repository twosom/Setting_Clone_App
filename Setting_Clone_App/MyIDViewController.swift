//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by Hope on 2021/12/12.
//

import UIKit

class MyIDViewController: UIViewController {


    @IBOutlet
    var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }

    @IBOutlet
    var cancelButton: UIButton!

    @IBOutlet
    var emailTextField: UITextField!

    override
    func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }

    @objc
    func textFieldDidChanged(_ sender: UITextField) {
        guard let text: String = sender.text else {
            return
        }

        nextButton.isEnabled = !text.isEmpty
    }


    @IBAction
    func clickIForgot(_ sender: UIButton) {
        let uiAlertController = UIAlertController(title: "Apple ID가 없거나\n잊어버렸습니까?", message: nil, preferredStyle: .alert)
        let actionList: [UIAlertAction] = [
            UIAlertAction(title: "Apple ID 생성", style: .default),
            UIAlertAction(title: "Apple ID를 잊어버렸습니까?", style: .default),
            UIAlertAction(title: "취소", style: .cancel)
        ]

        actionList.forEach { (action: UIAlertAction) in
            uiAlertController.addAction(action)
        }

        present(uiAlertController, animated: true)
    }

    @IBAction
    func clickCancel(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
