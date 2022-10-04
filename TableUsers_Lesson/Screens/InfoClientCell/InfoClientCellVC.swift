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
    
    // MARK: - IBOutlets
    
    private var editClient = EditClient.openLable
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
    }
}

    // MARK: - Private Extension

extension InfoClientCellVC {
    
    @IBAction func saveButton() {
        
    }
}

private extension InfoClientCellVC {
    func setupUI() {
    rightButton()
    }
    
    func setupEnum(page changes: EditClient) {
        switch changes {
        case .openLable:
            nameLabel.isHidden = false
            surNameLabel.isHidden = false
            ageLabel.isHidden = false
        case .openTextField:
            nameTextField.isHidden = true
            surnameTextField.isHidden = true
            ageTextField.isHidden = true
        }
    }
    
    func  rightButton() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(button))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc
    func button() {
        setupEnum(page: editClient)
    }
}

