//
//  ViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 18/03/21.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    private let dimension = CGSize(width: 128, height: 128)
    private let dimen = CGFloat(64.0)
    
    private lazy var avatar: UIImageView = {
        
        let uiImageView = UIImageView(image: UIImage(named: "avatar"))
        
        uiImageView.autoSetDimensions(to: dimension)
        uiImageView.clipsToBounds = true

        let layer = uiImageView.layer
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = dimen
        
        return uiImageView
    }()
    
    private lazy var upperView: UIView = {
        let view = UIView()
        view.autoSetDimension(.height, toSize: dimension.width)
        view.backgroundColor = .gray
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.view.addSubview(upperView)
        self.view.addSubview(avatar)

        setupConstraints()
    }
    
    private func setupConstraints() {
        avatar.autoAlignAxis(toSuperviewAxis: .vertical)
        avatar.autoPinEdge(toSuperviewEdge: .top, withInset: dimen)
        
        upperView.autoPinEdge(toSuperviewEdge: .left)
        upperView.autoPinEdge(toSuperviewEdge: .right)
        upperView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    }
}

