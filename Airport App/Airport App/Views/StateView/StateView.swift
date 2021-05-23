//
//  StateView.swift
//  Airport App
//
//  Created by Jose Torres on 5/22/21.
//

import UIKit

final class StateView: UIView {
    
    public var title: UILabel
    
    required init?(coder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    init(text: String, color: UIColor) {
        title = UILabel(frame: .zero)
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 40.0)))
        setup(text: text, color: color)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 8.0, height: 8.0)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    private func setup(text: String, color: UIColor) {
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        title.text = text
        title.translatesAutoresizingMaskIntoConstraints = false        
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        title.textColor = .white
        title.textAlignment = .center
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
}
