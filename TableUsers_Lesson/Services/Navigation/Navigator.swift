//
//  Navigator.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import Foundation
import UIKit


protocol NavigatorProtocol {
    func showCreateClientVC(view: UIViewController, delegate: DetailInfoPresenterDelegate)
    func showCellScreen(view: UIViewController, delegate: InfoClientDelegate, model: MyClient)
    func popViewController(view: UIViewController)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler() 
    
    func showFirstVC() -> UIViewController {
        let vc = assembler.createFirstVC(navigator: self)
        
        return vc
    }
    
    func showCreateClientVC(view: UIViewController, delegate: DetailInfoPresenterDelegate) {
        let vc = assembler.createClientVC(delegate: delegate, navigator: self)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCellScreen(view: UIViewController, delegate: InfoClientDelegate, model: MyClient) {
        let vc = assembler.createInfoCell(navigator: self, delegate: delegate, model: model )
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popViewController(view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
}
