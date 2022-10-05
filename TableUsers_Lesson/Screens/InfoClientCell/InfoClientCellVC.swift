//
//  InfoClientCellVC.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import UIKit

// MARK: - Class InfoClientCellVC

class InfoClientCellVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!

    // MARK: - Properties
    
    private var editClient = EditClient.openLable {
        didSet {
            UIView.animate(withDuration: 1) {
                self.setupVCState()
            }
        }
    }
    private let presenter: InfoClientCellPresenter
    
    // MARK: - Init
    
    init(presenter: InfoClientCellPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVCState()
    }
}

// MARK: - Private Extension

extension InfoClientCellVC {
    
    @IBAction func saveButton() {
        let infoClient = MyClient(name: nameTextField.text ?? "", surName: surnameTextField.text ?? "", age: Int16(ageTextField.text ?? "") ?? 0)
        presenter.getTextInfo(model: infoClient)
        presenter.popView(vc: self)
    }
}

private extension InfoClientCellVC {
    func setupUI() {
        setupTextFields()
        rightButton()
    }

    func setupTextFields() {
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        surnameTextField.delegate = self
        surnameTextField.returnKeyType = .done
        ageTextField.delegate = self
        ageTextField.returnKeyType = .done
    }
    
    func setupVCState() {
        switch editClient {
        case .openLable:
            nameLabel.isHidden = false
            surNameLabel.isHidden = false
            ageLabel.isHidden = false
            nameTextField.isHidden = true
            surnameTextField.isHidden = true
            ageTextField.isHidden = true
            editButton.isHidden = true

            title = "Label style"
        case .openTextField:
            nameLabel.isHidden = true
            surNameLabel.isHidden = true
            ageLabel.isHidden = true
            nameTextField.isHidden = false
            surnameTextField.isHidden = false
            ageTextField.isHidden = false
            editButton.isHidden = false

            title = "Text Field style"
        }
    }
    
    func rightButton() {
        let button = UIBarButtonItem(title: "Change State", style: .plain, target: self, action: #selector(button))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func button() {
        editClient = editClient == .openLable ? .openTextField : .openLable
    }
}

extension InfoClientCellVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            surnameTextField.becomeFirstResponder()
        } else if textField == surnameTextField {
            ageTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
}




