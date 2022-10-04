//
//  DetailInfoPresenter.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import Foundation

// MARK: - Protocol Presenter

protocol DetailInfoPresenterDelegate {
    
    func send(myModel: MyClient)
}

protocol DetailInfoPresenterProtocol {
    
    
    func getText(myModel: MyClient)
}

// MARK: - Class

class DetailInfoPresenter: DetailInfoPresenterProtocol {
    
    // MARK: - Properties
    
    private let delegate: DetailInfoPresenterDelegate
    private let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(delegate: DetailInfoPresenterDelegate, navigator: NavigatorProtocol) {
        self.delegate = delegate
        self.navigator = navigator
    }
    
    // MARK: - Method
    
    func getText(myModel: MyClient) {
        delegate.send(myModel: myModel)
    }
}

// MARK: - Private Extension




