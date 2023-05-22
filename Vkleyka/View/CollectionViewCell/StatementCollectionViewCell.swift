//
//  StatementCollectionViewCell.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import UIKit

class StatementCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StatementCollectionViewCell"
    
    private let firstCountryImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "kz")
        return view
    }()
    
    private let firstCountryLabel: UILabel = {
        let label = UILabel()
        label.text = "Казахстан"
        label.font = UIFont(name: "Jost", size: 14.0)
        return label
    }()
    
    private let line38Image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "line38")
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
      
        return view
    }()
    
    private let secondCountryLabel: UILabel = {
        let label = UILabel()
        label.text = "Индия"
        label.font = UIFont(name: "Jost", size: 14.0)
       
        return label
    }()
    
    private let secondCountryImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "kz")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
       
        return view
    }()
    
    private let typeOfVisa: UILabel = {
        let label = UILabel()
        label.text = "Туристическая"
        label.font = UIFont(name: "Jost", size: 14.0)
        
        return label
    }()
    
    private let visaDateReceipt: UILabel = {
        let label = UILabel()
        label.text = "27.03.2023"
        label.font = UIFont(name: "Jost", size: 12.0)
        label.textColor = UIColor.gray
       
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
        self.backgroundColor = UIColor(named: "searchBarBGColor")
        self.layer.cornerRadius = 17
    
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(10)
        }
       
        let firstCountryStack = UIStackView()
        firstCountryStack.axis = .horizontal
        firstCountryStack.addArrangedSubview(firstCountryImage)
        firstCountryImage.snp.makeConstraints { make in
            make.size.equalTo(28)
        }
        firstCountryStack.addArrangedSubview(firstCountryLabel)
       
        
        let secondCountryStack = UIStackView()
        secondCountryStack.axis = .horizontal
        secondCountryStack.addArrangedSubview(secondCountryImage)
        secondCountryImage.snp.makeConstraints { make in
            make.size.equalTo(28)
        }
        secondCountryStack.addArrangedSubview(secondCountryLabel)
        
        let topStackView = UIStackView()
        mainStack.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(firstCountryStack)
        topStackView.addArrangedSubview(secondCountryStack)
       
        let bottomStackView = UIStackView()
        mainStack.addArrangedSubview(bottomStackView)
        bottomStackView.alignment = .fill

        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)

        bottomStackView.addArrangedSubview(typeOfVisa)
        bottomStackView.addArrangedSubview(spacerView)
        bottomStackView.addArrangedSubview(visaDateReceipt)
      
        
    
    }
}
