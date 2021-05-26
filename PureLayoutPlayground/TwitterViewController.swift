//
//  TwitterViewController.swift
//  PureLayoutPlayground
//
//  Created by Thiago Antonio Ramalho on 25/05/21.
//

import UIKit

class TwitterViewController: UIViewController {

    private var twitterProfileView: TwitterProfileVIew!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.twitterProfileView = TwitterProfileVIew(frame: .zero)
        self.view.addSubview(twitterProfileView)
        
        twitterProfileView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    }
}
