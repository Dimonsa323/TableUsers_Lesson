//
//  ListOfClientsPresenter.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import Foundation
import UIKit

// MARK: - Protocol Presenter

protocol ListOfClientDelegate {
    
}

protocol ListOfClientsPresenterProtocol {
    
    var myClient: [MyClient] { get set }
    
    func showTextFieldScreen(vc: UIViewController)
    func saveUserInDatabase(user: MyClient, closure: () -> ())
    func fetchRequest(closure: () -> ())
    func deleteUser(indexPath: IndexPath, closure: () -> ())
    func updateUser(indexPath: IndexPath, localUser: MyClient, closure:() -> ())
    func showInfoCell(view: UIViewController)
}

// MARK: - Class

class ListOfClientsPresenter: ListOfClientsPresenterProtocol {
    
    // MARK: - Properties
    
    var myClient: [MyClient] = []
    var firstVC: ListOfClientProtocol!
    var getInfoVC: ListOfClientProtocol!
    
    private let deligate: ListOfClientDelegate
    private let navigator: NavigatorProtocol
    private let coreDataStore: CoreDataStoreProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol,
         coreDataStore: CoreDataStoreProtocol,
         deligate: ListOfClientDelegate) {
        self.navigator = navigator
        self.coreDataStore = coreDataStore
        self.deligate = deligate
    }
    
    // MARK: - Method
    
    func set(firstVC: ListOfClientProtocol) {
        self.firstVC = firstVC
    }
    
    func info(getInfoVC: ListOfClientProtocol) {
        self.getInfoVC = getInfoVC
    }
    
    func showTextFieldScreen(vc: UIViewController) {
        navigator.showCreateClientVC(view: vc, delegate: self)
    }
    
    func showInfoCell(view: UIViewController) {
        navigator.showCellScreen(view: view, delegate: self)
    }
    
    
    func saveUserInDatabase(user: MyClient, closure: () -> ()) {
        self.myClient.append(user)
        
        let userCore = ClientInfoEntity(context: coreDataStore.context)
        
        userCore.name = user.name
        userCore.surName = user.surName
        userCore.age = user.age
        userCore.id = user.id
        
        print(userCore.id)
        
        coreDataStore.saveContext()
        closure()
    }
    
    func fetchRequest(closure: () -> ()) {
        myClient = coreDataStore.fetchRequest()
        closure()
    }
    
    func deleteUser(indexPath: IndexPath, closure: () -> ()) {
        coreDataStore.deleteUsers(id: myClient[indexPath.row].id)
        myClient.remove(at: indexPath.row)
        closure()
    }
    
    func updateUser(indexPath: IndexPath, localUser: MyClient, closure: () -> ()) {
        coreDataStore.updateUser(localUser: localUser)
        myClient[indexPath.row] = localUser
        closure()
    }
}

// MARK: - Private Extension

extension ListOfClientsPresenter: DetailInfoPresenterDelegate {
    func send(myModel: MyClient) {
        myClient.append(myModel)
        firstVC.reloadTableView()
    }
}

extension ListOfClientsPresenter: InfoClientDelegate {
    func sendInfoFirstVC(model: MyClient) {
        myClient.append(model)
        getInfoVC.reloadTableView()
    }
}
