//
//  Assembler.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import Foundation
import UIKit

class Assembler {
    
    private let coreDataStore = CoreDataStore()
    
    func createFirstVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = ListOfClientsPresenter(navigator: navigator, coreDataStore: coreDataStore )
        let vc = ListOfClientsVC(presenter: presenter)
        
        return vc
    }
    
    func createClientVC(delegate: DetailInfoPresenterDelegate, navigator: NavigatorProtocol) -> UIViewController {
        let presenter = DetailInfoPresenter(delegate: delegate, navigator: navigator)
        let vc = DetailInfoVC(presenter: presenter)
        
        return vc
    }
}
