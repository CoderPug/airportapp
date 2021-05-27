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
    @IBOutlet weak var airlineTitle: UILabel!
    @IBOutlet weak var airline: UILabel!
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var hourTitle: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var counterTitle: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var gateTitle: UILabel!
    @IBOutlet weak var gate: UILabel!
    @IBOutlet weak var remarks: UILabel!
    @IBOutlet weak var separatorLine1: UIView!
    @IBOutlet weak var separatorLine2: UIView!
    
    private var stateView: StateView?

    override func prepareForReuse() {
        stateView?.removeFromSuperview()
        stateView = nil
    }
    
    public func setup(for type: FlightCellType, with state: String, color: UIColor) {
        separatorLine1.backgroundColor = color
        separatorLine2.backgroundColor = .systemGray4
        setupLabels(for: type)
        stateView = StateView(text: state.uppercased(), color: color)
        guard let stateView = stateView else { return }
        addSubview(stateView)
        NSLayoutConstraint.activate([
            stateView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stateView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupLabels(for type: FlightCellType) {
        airlineTitle.text = NSLocalizedString("Flight", comment: "Flight in cell title").uppercased()
        hourTitle.text = NSLocalizedString("Hour", comment: "Hour in cell title").uppercased()
        switch type {
        case .arrival:
            cityTitle.text = NSLocalizedString("From", comment: "City in cell title").uppercased()
            counterTitle.text = NSLocalizedString("Belt", comment: "Counter/Belt in cell title").uppercased()
            gateTitle.text = "-"
        case .departure:
            cityTitle.text = NSLocalizedString("To", comment: "City in cell title").uppercased()
            counterTitle.text = NSLocalizedString("Counter", comment: "Counter/Belt in cell title").uppercased()
            gateTitle.text = NSLocalizedString("Gate", comment: "Gate in cell title").uppercased()
        }
    }
}
