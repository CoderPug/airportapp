//
//  ViewController.swift
//  Airport App
//
//  Created by Jose Torres on 4/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private lazy var flightsViewModel: FlightsViewModel = {
        return FlightsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FlightCell.self)
        flightsViewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        flightsViewModel.loadInternationalDeparture()
    }
}

extension ViewController: UITableViewDelegate {
        
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeReusableCell(FlightCell.self)
        
        let flightViewModel = flightsViewModel.getFlight(for: indexPath)
        
//        let e: (String) -> Void = { element in
//            cell.code.text = element
//        }
//        let codeBond = Bond(e)
//        codeBond.bind(flightViewModel.code)
        
        cell.code.textBond.bind(flightViewModel.code)
        cell.airline.textBond.bind(flightViewModel.airline)
        cell.destination.textBond.bind(flightViewModel.destination)
        cell.hour.textBond.bind(flightViewModel.hour)
        cell.counter.textBond.bind(flightViewModel.carousel)
        cell.gate.textBond.bind(flightViewModel.gate)
        cell.date.textBond.bind(flightViewModel.date)
        cell.remarks.textBond.bind(flightViewModel.state)
        
        flightViewModel.code.value = flightViewModel.code.value
        flightViewModel.airline.value = flightViewModel.airline.value
        flightViewModel.destination.value = flightViewModel.destination.value
        flightViewModel.hour.value = flightViewModel.hour.value
        flightViewModel.carousel.value = flightViewModel.carousel.value
        flightViewModel.gate.value = flightViewModel.gate.value
        flightViewModel.date.value = flightViewModel.date.value
        flightViewModel.state.value = flightViewModel.state.value
        
        return cell
    }
    
}
