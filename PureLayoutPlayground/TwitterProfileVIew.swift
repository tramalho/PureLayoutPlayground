//
//  TwitterProfileVIew.swift
//  PureLayoutPlayground
//
//  Created by Thiago Antonio Ramalho on 25/05/21.
//

import UIKit
import PureLayout

class TwitterProfileVIew: UIView {

    private var shouldSetupConstraints = true
    
    private let profileSize:CGFloat = 124.0
    
    private lazy var bannerView: UIImageView = {
        
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = UIColor.gray
        imageView.contentMode = .scaleAspectFill
        imageView.autoSetDimension(.height, toSize: screenSize.width/3)
        
        return imageView
    }()
    
    private lazy var profileView: UIImageView = {
        
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = UIColor.gray
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = 5.0
        imageView.autoSetDimension(.width, toSize: profileSize)
        imageView.autoSetDimension(.height, toSize: profileSize)
        
        return imageView
    }()

    private var segmentControl: UISegmentedControl = {
        
        let itens = ["Tweets", "Media", "Likes"]
        
        let segmentControl = UISegmentedControl(items: itens)
        
        return segmentControl
    }()
    
    private let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerView)
        addSubview(profileView)
        addSubview(segmentControl)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func updateConstraints() {
        
        if shouldSetupConstraints {
            
            let edgeInset: CGFloat = 10.0
            let centerOffset: CGFloat = 62.0
            
            bannerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
            
            profileView.autoPinEdge(toSuperviewEdge: .left, withInset: edgeInset)
            profileView.autoPinEdge(.bottom, to: .bottom, of: bannerView, withOffset: centerOffset)
            
            segmentControl.autoPinEdge(toSuperviewEdge: .bottom, withInset: edgeInset)
            segmentControl.autoPinEdge(toSuperviewEdge: .left, withInset: edgeInset)
            segmentControl.autoPinEdge(toSuperviewEdge: .right, withInset: edgeInset)
            
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
}
