//
//  ListOfClientsVC.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import UIKit

// MARK: - Protocol

protocol ListOfClientProtocol {
   // func editComplete(model: MyClient)
    func reloadTableView()
}

// MARK: - Class

class ListOfClientsVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak private var tableView: UITableView!
    
    private let presenter: ListOfClientsPresenterProtocol
    private let cellIdentifier: String = String(describing: ClientsCell.self)
    
    init(presenter: ListOfClientsPresenterProtocol) {
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

private extension ListOfClientsVC {
    
    func setupUI() {
        setupTableView()
        rightButton()
        
    }
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func rightButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(button))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    func button() {
        presenter.showTextFieldScreen(vc: self)
    }
}

extension ListOfClientsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showInfoCell(view: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.myClient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ClientsCell
        let user = presenter.myClient[indexPath.row]
        cell.config(user: user)
        
        return cell
    }
}

extension ListOfClientsVC: ListOfClientProtocol {
    
    func reloadTableView() {
        tableView.reloadData() 
    }
}
