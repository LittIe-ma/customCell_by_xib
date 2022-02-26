//
//  customCell.swift
//  customCell_by_xib
//
//  Created by Masato Yasuda on 2022/02/19.
//

import UIKit

class CustomCell: UITableViewCell {

    static var className: String { String(describing: CustomCell.self) }
    @IBOutlet weak var dynamicLabel: UILabel!
    
    //MARK: - PARTS
    @IBOutlet weak var postFrameView: UIView! {
        didSet {
            postFrameView.backgroundColor = .systemBackground
            postFrameView.layer.borderWidth = 1
            postFrameView.layer.borderColor = UIColor.systemGray6.cgColor
            postFrameView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
            postFrameView.layer.shadowColor = UIColor.black.cgColor
            postFrameView.layer.shadowOpacity = 0.4
            postFrameView.layer.shadowRadius = 4
            postFrameView.layer.cornerRadius = 10
        }
    }
}
