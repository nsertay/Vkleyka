//
//  PopularCollectionViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "США"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("error")
    }
    
    private func initialize() {
        let yStack = UIStackView()
        yStack.axis = .vertical
        addSubview(yStack)
        yStack.addArrangedSubview(imageView)
        yStack.addArrangedSubview(countryLabel)
        yStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.image = UIImage(named: "USA")
        imageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(148)
        }
        
        
        
    }
    
}


