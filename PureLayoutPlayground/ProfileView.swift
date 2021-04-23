//
//  ProfileView.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 22/04/21.
//

import UIKit

class ProfileView: UIView {

    var tableview: UITableView!
    
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
        segmentedControl.tintColor = .gray
        
        return segmentedControl
    }()
    
    private lazy var editButton: UIButton = {
        
        let uiButton = UIButton.newAutoLayout()

        uiButton.setTitle("Edit", for: UIControl.State())
        uiButton.setTitleColor(.gray, for: .normal)
        uiButton.setTitleColor(.lightGray, for: .highlighted)
        uiButton.layer.borderColor = UIColor.gray.cgColor
        uiButton.layer.cornerRadius = 4.0
        uiButton.layer.borderWidth = 1
        uiButton.tintColor = .gray
        uiButton.backgroundColor = .clear
        uiButton.autoSetDimension(.width, toSize: buttonDimen.width)
        uiButton.autoSetDimension(.height, toSize: buttonDimen.height)
        
        return uiButton
    }()

    init(tableview: UITableView) {
        super.init(frame: .zero)
        self.tableview = tableview
        addSubviews()
        bringSubviewToFront(avatar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(upperView)
        addSubview(avatar)
        addSubview(editButton)
        addSubview(segmentedControl)
        addSubview(tableview)
    }
    
    override func updateConstraints() {
        let offset = CGFloat(8.0)
        let doubleOffset = offset * 2
        
        avatar.autoAlignAxis(toSuperviewAxis: .vertical)
        avatar.autoPinEdge(toSuperviewEdge: .top, withInset: dimen)
        
        upperView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
//        upperView.autoPinEdge(toSuperviewEdge: .left)
//        upperView.autoPinEdge(toSuperviewEdge: .right)
        
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: offset)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: offset)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: avatar, withOffset: doubleOffset)

        editButton.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: doubleOffset)
        editButton.autoPinEdge(toSuperviewEdge: .right, withInset: offset)

        tableview.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        tableview.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: offset)

        super.updateConstraints() // Always at the bottom of the function
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
