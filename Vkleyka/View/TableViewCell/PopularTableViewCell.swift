//
//  PopularTableViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    static let reuseIdentfier = "PopularTableViewCell"
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Jost", size: 20.0)
        label.textColor = UIColor(named: "mainBlackColor")
        label.text = "Популярные страны для поездки"
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
        
        contentView.addSubview(popularLabel)
        popularLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview()
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(popularLabel).offset(30)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension PopularTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
        
        return cell
    }
    
}

extension PopularTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 130, height: 180)
    }
}
