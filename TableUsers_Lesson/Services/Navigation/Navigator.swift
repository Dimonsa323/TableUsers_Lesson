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
}
