//
//  SectionHeader.swift
//  Airport App
//
//  Created by Jose Torres on 5/20/21.
//

import UIKit

final class SectionHeader: UIView {
    
    public var title: UILabel
    
    required init?(coder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    init(width: CGFloat) {
        
        title = UILabel(frame: .zero)
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: width, height: 0)))
        setup()
    }
    
    override init(frame: CGRect) {
        
        title = UILabel(frame: .zero)
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 12.0)
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            title.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            title.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
    }
}
