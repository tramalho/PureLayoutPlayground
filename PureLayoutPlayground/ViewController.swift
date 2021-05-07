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
        uiTableView.estimatedRowHeight = 64
        uiTableView.rowHeight = UITableView.automaticDimension
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
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
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
        return 4
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
        case 3:
            setValueInCell(cell: cell, title: "Address", description: "45, Walt Disney St.\n37485, Mickey Mouse State")
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


