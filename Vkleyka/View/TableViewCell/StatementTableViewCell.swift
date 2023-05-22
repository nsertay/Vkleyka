//
//  StatementTableViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    static let reuseIdentfier = "StatementTableViewCell"
    
    var statements: [Statement] = [Statement(firstCountryName: "Казахстан", firstCountryImage: "kz", secondCountryName: "Индия", secondCountryImage: "ind", visaType: .tourist, dateOfIssue: "27.03.2023")]
    
    private let statementLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Jost", size: 16.0)
        label.text = "Вернуться к заявлениям"
        label.textColor = UIColor(named: "mainBlackColor")
        return label
    }()
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("error")
    }
    
    private func initialize() {
        backgroundColor = UIColor(named: "mainBackgroundColor")
        
        contentView.addSubview(statementLabel)
        statementLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview()
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StatementCollectionViewCell.self, forCellWithReuseIdentifier: StatementCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(statementLabel).offset(20)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(110)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension StatementTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatementCollectionViewCell.identifier, for: indexPath) as! StatementCollectionViewCell
        
        return cell
    }
}

extension StatementTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 222, height: 82)
    }
}
