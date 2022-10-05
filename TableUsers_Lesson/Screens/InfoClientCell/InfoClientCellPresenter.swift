//
//  InfoClientCellPresenter.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import Foundation
import UIKit

protocol InfoClientDelegate {
    func sendInfoFirstVC(model: MyClient) 
}

protocol InfoClientCellPresenterProtocol {
    var myClient: [MyClient] { get set }
    
    func getTextInfo(model: MyClient)
}

class InfoClientCellPresenter: InfoClientCellPresenterProtocol {
    
    var myClient: [MyClient] = []
    
    private let delegate: InfoClientDelegate
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol, delegate: InfoClientDelegate) {
        self.navigator = navigator
        self.delegate = delegate
    }
    
    func getTextInfo(model: MyClient) {
        delegate.sendInfoFirstVC(model: model)
    }
}

extension InfoClientCellPresenter {
    
    func popView(vc: UIViewController) {
        navigator.popViewController(view: vc)
    }
}
