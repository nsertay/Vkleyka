//
//  ButtonsTableViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class ButtonsTableViewCell: UITableViewCell {

    static let reuseIdentfier = "ButtonsTableViewCell"
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Посмотреть все", for: .normal)
        button.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    private var articleLabel: UILabel = {
        let label = UILabel()
        label.text = "Читать статьи"
        label.textColor = UIColor(named: "mainBlackColor")
        label.font = UIFont(name: "Jost", size: 20.0)
        return label
    }()
    
    private var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Еще", for: .normal)
        button.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ButtonsTableViewCell {
    func initialize() {
        backgroundColor = UIColor(named: "mainBackgroundColor")
        
        let xStack = UIStackView()
        xStack.axis = .horizontal
        
        
        
        addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        addSubview(xStack)
        xStack.addArrangedSubview(articleLabel)
        xStack.addArrangedSubview(moreButton)
        xStack.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
            
        }

        
    }
}
