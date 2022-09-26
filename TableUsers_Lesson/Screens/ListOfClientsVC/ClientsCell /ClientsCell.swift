//
//  ClientsCell.swift
//  TableUsers_Lesson
//
//  Created by Дима Губеня on 25.09.2022.
//

import UIKit

class ClientsCell: UITableViewCell {
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var surNameLabel: UILabel!
    @IBOutlet weak private var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func config(user: MyClient) {
        nameLabel.text = user.name
        surNameLabel.text = user.surName
        ageLabel.text = "My age \(user.age)"
    }
}

private extension ClientsCell {
    func setupUI() {
        selectionStyle = .none
    }
}
