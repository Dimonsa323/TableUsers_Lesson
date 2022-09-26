//
//  DetailInfoVC.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import UIKit

// MARK: - Protocol


// MARK: - Class

class DetailInfoVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    // MARK: - Properties
    
    private let presenter: DetailInfoPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: DetailInfoPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Private Extension 

extension DetailInfoVC {
    @IBAction func changeButton(_ sender: Any) {
        presenter.getText(with: nameTextField.text ?? "")
        presenter.getText(with: surNameTextField.text ?? "")
        presenter.getText(with: ageTextField.text ?? "")
    }
}
