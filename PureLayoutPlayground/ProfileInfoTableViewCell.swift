//
//  ProfileInfoTableViewCell.swift
//  PureLayoutPlayground
//
//  Created by Thiago Ramalho on 23/04/21.
//

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {

    private let fullMargin: CGFloat = 16
    private let halfMargin: CGFloat = 8
    private let quarterMargin: CGFloat = 4
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .gray
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func updateConstraints() {
        let titleInsets = UIEdgeInsets(top: fullMargin, left: fullMargin, bottom: .zero, right: halfMargin)
        titleLabel.autoPinEdgesToSuperviewEdges(with: titleInsets, excludingEdge: .bottom)
        
        
        let descInsets = UIEdgeInsets(top: .zero, left: fullMargin, bottom: quarterMargin, right: halfMargin)
        descriptionLabel.autoPinEdgesToSuperviewEdges(with: descInsets, excludingEdge: .top)
        
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: fullMargin)
        super.updateConstraints()
    }
}
