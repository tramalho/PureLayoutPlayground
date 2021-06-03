//
//  HomeViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 18/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let screenList:[String:UIViewController] = [
        "SegmentedControlViewController": SegmentedControlViewController(),
        "TwitterViewController": TwitterViewController(),
        "BeutifulHelloWorldViewController": BeutifulHelloWorldViewController(),
        "AnimationViewController": AnimationViewController()
    ]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        stackView.axis = NSLayoutConstraint.Axis.vertical

        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.spacing   = 16.0
                
        screenList.forEach { (key: String, value: UIViewController) in
            createButtonWithAction(key: key, value: value)
        }
        
        anchorViews()
    }
    
    private func createButtonWithAction(key: String, value: UIViewController) {
                
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            self.navigationController?.pushViewController(value, animated: true)
        }))
            
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(key, for: .normal)
        self.stackView.addArrangedSubview(button)
        button.sizeToFit()
        button.autoSetDimension(.height, toSize: 48)
        stackView.bringSubviewToFront(button)
    }

    private func anchorViews() {
        stackView.autoCenterInSuperviewMargins()
        stackView.autoPinEdge(.trailing, to: .trailing, of: self.view, withOffset: -20)
        stackView.autoPinEdge(.leading, to: .leading, of: self.view, withOffset: 20)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
