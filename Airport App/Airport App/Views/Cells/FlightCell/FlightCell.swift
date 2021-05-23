//
//  FlightCell.swift
//  Airport App
//
//  Created by Jose Torres on 5/15/21.
//

import Foundation
import UIKit

final class FlightCell: UITableViewCell {

    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var airline: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var gate: UILabel!
    @IBOutlet weak var remarks: UILabel!
    @IBOutlet weak var separatorLine1: UIView!
    @IBOutlet weak var separatorLine2: UIView!
    
    private var stateView: StateView?

    override func prepareForReuse() {
        stateView?.removeFromSuperview()
        stateView = nil
    }
    
    public func setup(with state: String, color: UIColor) {
        
        separatorLine1.backgroundColor = color
        separatorLine2.backgroundColor = .systemGray4
        
        stateView = StateView(text: state, color: color)
        guard let stateView = stateView else { return }
        addSubview(stateView)
        NSLayoutConstraint.activate([
            stateView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stateView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
}
