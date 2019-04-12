//
//  StretchyTableViewCell.swift
//  StretchTableView
//
//  Created by Anantha Krishnan K G on 12/04/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class StretchyTableViewCell: UITableViewCell {

    let view1: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpUI() {
        self.backgroundColor = .white
        
        view1.layer.cornerRadius = 10.0
        self.addSubview(view1)
        
        view1.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        view1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        view1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        view1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true

    }
}
