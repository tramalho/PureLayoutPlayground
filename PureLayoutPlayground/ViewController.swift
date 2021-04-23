//
//  ViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 18/03/21.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    private lazy var tableview: UITableView = {
       
        let uiTableView = UITableView()
        uiTableView.translatesAutoresizingMaskIntoConstraints = false
        uiTableView.delegate = self
        uiTableView.dataSource = self
        return uiTableView
        
    }()
    
    private lazy var profileView: ProfileView = {
        return ProfileView(tableview: tableview)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


