//
//  SearchBarTableViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {

    static let reuseIdentfier = "SearchBarTableViewCell"
    
    private let searchBar: UITextField = {
        let field = UITextField()
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        field.layer.cornerRadius = 10
        field.layer.backgroundColor = UIColor(named: "searchBarBGColor")?.cgColor
        field.placeholder = "Куда?"
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchBarTableViewCell {
    func initialize() {
        backgroundColor = UIColor(named: "mainBackgroundColor")
        
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        
    }
}
