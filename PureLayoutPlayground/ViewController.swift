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
    
    private let buttonDimen = CGSize(width: 96.0, height: 32.0)
    
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
    
    private lazy var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Personal", "Social", "Resumé"])

        segmentedControl.autoSetDimension(.height, toSize: buttonDimen.height)
        segmentedControl.selectedSegmentIndex = .zero
        segmentedControl.layer.borderColor = UIColor.gray.cgColor
        segmentedControl.backgroundColor = .gray
        
        return segmentedControl
    }()
    
    private lazy var editButton: UIButton = {
        let uiButton = UIButton()
       
        uiButton.setTitle("Edit", for: .normal)
        uiButton.setTitleColor(.gray, for: .normal)
        uiButton.layer.borderColor = UIColor.gray.cgColor
        uiButton.layer.cornerRadius = 4.0
        uiButton.layer.borderWidth = 1
        uiButton.tintColor = .gray
        uiButton.backgroundColor = .clear
        uiButton.autoSetDimension(.width, toSize: buttonDimen.width)
        uiButton.autoSetDimension(.height, toSize: buttonDimen.height)
        
        return uiButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
        self.view.backgroundColor = .white

        
        self.view.addSubview(upperView)
        self.view.addSubview(avatar)
        self.view.addSubview(editButton)
        self.view.addSubview(segmentedControl)

        setupConstraints()
    }
    
    private func setupConstraints() {
        let offset = CGFloat(8.0)
        let doubleOffset = offset * 2
        avatar.autoAlignAxis(toSuperviewAxis: .vertical)
        avatar.autoPinEdge(toSuperviewEdge: .top, withInset: dimen)
        
        upperView.autoPinEdge(toSuperviewEdge: .left)
        upperView.autoPinEdge(toSuperviewEdge: .right)
        upperView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: offset)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: offset)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: avatar, withOffset: doubleOffset)

        editButton.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: doubleOffset)
        editButton.autoPinEdge(toSuperviewEdge: .right, withInset: offset)
    }
}

