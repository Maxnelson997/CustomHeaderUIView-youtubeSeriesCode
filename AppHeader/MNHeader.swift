//
//  MNHeader.swift
//  AppHeader
//
//  Created by Max Nelson on 5/22/18.
//  Copyright © 2018 AsherApps. All rights reserved.
//

import UIKit

protocol MNHeaderDelegate {
    func handleAdd()
}

class MNHeader:MNGradient {
    
    var delegate:MNHeaderDelegate?
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton:UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "add-icon"), for: .normal)
        b.backgroundColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    @objc func handleAddButton() {
        delegate?.handleAdd()
    }
    
    init(frame:CGRect = .zero, title:String, subtitle:String) {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
        
        self.titleLabel.text = title
        self.subLabel.text = subtitle
        
        backgroundColor = .orange

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(subLabel)
        subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -28).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
