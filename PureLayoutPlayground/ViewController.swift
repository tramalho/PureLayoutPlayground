//
//  ViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 18/03/21.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    private let profileInfoCellReusebleIdentifier = "profileInfoCellReusebleIdentifier"
    
    private lazy var tableview: UITableView = {
       
        let uiTableView = UITableView()
        uiTableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: profileInfoCellReusebleIdentifier)
        uiTableView.rowHeight = 68
        uiTableView.translatesAutoresizingMaskIntoConstraints = false
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        return uiTableView
    }()
    
    private lazy var profileView: ProfileView = {
        return ProfileView(tableview: self.tableview)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.title = "Profile"
        self.view.backgroundColor = .white

        self.view.addSubview(profileView)
        
        self.profileView.autoPinEdgesToSuperviewEdges()
        
        self.view.layoutIfNeeded()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: profileInfoCellReusebleIdentifier, for: indexPath) as! ProfileInfoTableViewCell
        
        switch indexPath.row {
        case .zero:
            setValueInCell(cell: cell, title: "Phone", description: "+23456789")
        case 1:
            setValueInCell(cell: cell, title: "Email", description: "john@doe.com")
        case 2:
            setValueInCell(cell: cell, title: "LinkedIn", description: "www.linkedin.com/john-doe")
        default:
            break
        }
        
        return cell
    }
    
    private func setValueInCell(cell: ProfileInfoTableViewCell, title: String, description: String) {
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
    }
    
}


