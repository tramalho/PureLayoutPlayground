//
//  AnimationViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Antonio Ramalho on 02/06/21.
//

import UIKit
import PureLayout

enum SomeViewAnimation {
    case Collapse
    case Expanded
}

class AnimationViewController: UIViewController {

    private var updateConstraints = true
    
    private var typeAnimaton: SomeViewAnimation = .Collapse
    
    private var someViewBottomConstraint: NSLayoutConstraint?
    private var bottomViewHeightConstraint: NSLayoutConstraint?
    
    private lazy var someView: UIView = {
        let view  = UIView.newAutoLayout()
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view  = UIView.newAutoLayout()
        view.backgroundColor = .cyan
        return view
    }()
    
    private lazy var showAnimationButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "animate", style: .done, target: self, action: #selector(collapseBottomView))
        
        return barButton
    }()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(someView)
        self.view.addSubview(bottomView)
        self.navigationItem.rightBarButtonItem  = showAnimationButton
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        if updateConstraints {
            
            bottomView.autoPinEdge(toSuperviewEdge: .left)
            bottomView.autoPinEdge(toSuperviewEdge: .right)
            bottomView.autoPinEdge(toSuperviewEdge: .bottom)
            bottomView.autoSetDimension(.height, toSize: 35)
            
            someView.autoPinEdge(toSuperviewEdge: .left)
            someView.autoPinEdge(toSuperviewEdge: .right)
            someView.autoPinEdge(toSuperviewEdge: .top)
            someView.autoPinEdge(.bottom, to: .top, of: bottomView)
            
            
            updateConstraints = false
        }
        
        bottomViewHeightConstraint?.autoRemove()
        bottomViewHeightConstraint?.autoRemove()
        
        switch typeAnimaton {
        case .Expanded:
            
            bottomViewHeightConstraint = bottomView.autoPinEdge(toSuperviewEdge: .top)
            someViewBottomConstraint = someView.autoPinEdge(toSuperviewEdge: .bottom)
            break
        default:
            bottomViewHeightConstraint = bottomView.autoSetDimension(.height, toSize: 35)
            someViewBottomConstraint = someView.autoPinEdge(.bottom, to: .top, of: bottomView)

        }
                
        super.updateViewConstraints()
    }

    fileprivate func animation(nextAction: @escaping () -> Void) {
        self.view.setNeedsUpdateConstraints()
        self.view.updateConstraintsIfNeeded()
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 2,
            options: UIView.AnimationOptions(),
            animations: {
                self.view.layoutIfNeeded()
            }) { (Bool) in
            nextAction()
        }
    }
    
    private func expandBottomView() {
      self.typeAnimaton = .Expanded
        animation(nextAction: {
            self.collapseBottomView()
        })
    }

    @objc private func collapseBottomView() {
      self.typeAnimaton = .Collapse
        animation(nextAction: {
            self.expandBottomView()
        })
    }
    
}
