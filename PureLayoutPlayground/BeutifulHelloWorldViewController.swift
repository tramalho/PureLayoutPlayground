//
//  BeutifulHelloWorldViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Antonio Ramalho on 29/05/21.
//

import UIKit
import PureLayout

class BeutifulHelloWorldViewController: UIViewController {
    
    private var updateConstraint = true
    
    private let centerView = UIView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "This is Hello World\nwith PureLayout"
        
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "This is planet earth, there is only\none. Take care of him!"
        
        return label
    }()
    
    private lazy var earthImageView: UIImageView = {
       
        let image = UIImageView.newAutoLayout()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "world")
        
        return image
    }()
    
    private lazy var brandNameLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Medium"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.17, green: 0.75, blue: 0.97, alpha: 1.0)
        
        super.view.addSubview(centerView)
        self.centerView.addSubview(self.titleLabel)
        self.centerView.addSubview(self.descriptionLabel)
        self.centerView.addSubview(self.earthImageView)
        self.view.addSubview(self.brandNameLabel)
    }
    
    override func updateViewConstraints() {
        
        if updateConstraint {
            
            self.centerView.autoPinEdge(toSuperviewEdge: .trailing)
            self.centerView.autoPinEdge(toSuperviewEdge: .leading)
            self.centerView.autoPinEdge(toSuperviewSafeArea: .top)
            
            let titleInsets = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
            self.titleLabel.autoPinEdgesToSuperviewEdges(with: titleInsets)
            
            self.descriptionLabel.autoPinEdge(.top, to: .bottom, of: self.titleLabel, withOffset: 28)
            self.descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
            self.descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
            
            self.earthImageView.autoPinEdge(.top, to: .bottom, of: self.descriptionLabel, withOffset: 43)
            self.earthImageView.autoPinEdge(toSuperviewEdge: .leading)
            self.earthImageView.autoPinEdge(toSuperviewEdge: .trailing)
            self.earthImageView.autoAlignAxis(toSuperviewAxis: .vertical)
            self.earthImageView.autoSetDimension(.height, toSize: 255)
            
            self.brandNameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
            self.brandNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
            self.brandNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        }
        
        super.updateViewConstraints()
    }
}
