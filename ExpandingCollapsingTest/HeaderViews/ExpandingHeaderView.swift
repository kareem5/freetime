//
//  ExpandingHeaderView.swift
//  ExpandingCollapsingTest
//
//  Created by Kareem Mohammed on 7/30/17.
//  Copyright © 2017 kareem. All rights reserved.
//

import UIKit

protocol ExpandingHeaderViewDelegate {
    func toogleSection(header: ExpandingHeaderView, section: Int)
}

class ExpandingHeaderView: UITableViewHeaderFooterView {

    var delegate: ExpandingHeaderViewDelegate?
    var section: Int!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
//        fatalError("init(coder:) has not been implemented")
    }
    
    func selectHeaderView(gesture: UITapGestureRecognizer) {
        let cell = gesture.view as! ExpandingHeaderView
        delegate?.toogleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, subtitle: String, section: Int, delegate: ExpandingHeaderViewDelegate) {
        self.lblTitle.text = title
        self.lblSubtitle.text = subtitle
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.lblTitle?.textColor = .white
        self.lblSubtitle?.textColor = .white
        self.contentView.backgroundColor = .darkGray
    }
    
}
