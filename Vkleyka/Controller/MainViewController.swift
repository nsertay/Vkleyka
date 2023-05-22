//
//  MainViewController.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 21.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: SearchBarTableViewCell.reuseIdentfier)
        tableView.register(PopularTableViewCell.self, forCellReuseIdentifier: PopularTableViewCell.reuseIdentfier)
        tableView.register(ButtonsTableViewCell.self, forCellReuseIdentifier: ButtonsTableViewCell.reuseIdentfier)
        tableView.register(ArticlesTableViewCell.self, forCellReuseIdentifier: ArticlesTableViewCell.reuseIdentfier)
        tableView.register(StatementTableViewCell.self, forCellReuseIdentifier: StatementTableViewCell.reuseIdentfier)
        
        return tableView
    }()
    
    private enum Colors {
        static let mainColor = UIColor(named: "mainColor")
        static let mainBGColor = UIColor(named: "mainBackgroundColor")
    }
    
    private enum Fonts {
        static let navTitleFont = UIFont(name: "Jost-Bold", size: 24.0)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        customLargeTitle()
        initialize()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.mainBGColor
    }
}

extension MainViewController {
    
    func customLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        if let appearance = navigationController?.navigationBar.standardAppearance {
            appearance.configureWithTransparentBackground()
            
            if let customFont = Fonts.navTitleFont {
                appearance.titleTextAttributes = [.foregroundColor: Colors.mainColor!]
                appearance.largeTitleTextAttributes = [.foregroundColor: Colors.mainColor!, .font: customFont]
            }
           
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func initialize() {
    
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableViewCell.reuseIdentfier, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.reuseIdentfier, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsTableViewCell.reuseIdentfier, for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.reuseIdentfier, for: indexPath)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: StatementTableViewCell.reuseIdentfier, for: indexPath)
            return cell
        default:
            fatalError("No Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
