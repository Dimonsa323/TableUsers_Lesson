//
//  DetailInfoPresenter.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 22.09.2022.
//

import Foundation


// MARK: - Protocol Presenter

protocol DetailInfoPresenterDelegate {
    
    func send(with text: String)
}

protocol DetailInfoPresenterProtocol {
    
  //  var text: String { get set }
    func getText(with text: String)
}

// MARK: - Class

class DetailInfoPresenter: DetailInfoPresenterProtocol {
    
    // MARK: - Properties
    
//    var text: String
    
    private let delegate: DetailInfoPresenterDelegate
    private let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(delegate: DetailInfoPresenterDelegate, navigator: NavigatorProtocol) {
        self.delegate = delegate
        self.navigator = navigator
    }
    
    // MARK: - Method
    
    func getText(with text: String) {
        delegate.send(with: text)
    }
}

// MARK: - Private Extension




