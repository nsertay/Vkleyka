//
//  ArticlesTableViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    static let reuseIdentfier = "ArticlesTableViewCell"
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ArticlesCollectionViewCell.self, forCellWithReuseIdentifier: ArticlesCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(230)
            make.bottom.equalToSuperview().inset(20)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension ArticlesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticlesCollectionViewCell.identifier, for: indexPath)
        return cell
    }
}

extension ArticlesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 225, height: 225)
    }
}
