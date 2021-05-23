//
//  HeaderView.swift
//  Airport App
//
//  Created by Jose Torres on 5/22/21.
//

import UIKit

final class HeaderView: UIView {
    
    private var title: UILabel
    private var image: UIImageView
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        title = UILabel(frame: .zero)
        image = UIImageView(frame: .zero)
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrival-icon")
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        title.text = "LLEGADAS INTERNACIONALES \u{25BC}"
        title.textColor = UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        addSubview(image)
        addSubview(title)
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40),
            title.leadingAnchor.constraint(equalTo: image.layoutMarginsGuide.trailingAnchor, constant: 20),
            title.centerYAnchor.constraint(equalToSystemSpacingBelow: image.layoutMarginsGuide.centerYAnchor, multiplier: 1),
            title.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: 15)
        ])
    }
}