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
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var gate: UILabel!
    @IBOutlet weak var remarks: UILabel!
}
