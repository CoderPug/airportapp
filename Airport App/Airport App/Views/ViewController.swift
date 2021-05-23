//
//  ViewController.swift
//  Airport App
//
//  Created by Jose Torres on 4/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var topView: UIView!
    
//        return FlightsViewModel(service: MockFlightsServiceItem(type: .multiple))
    private lazy var flightsViewModel: FlightsViewModel = {
        return FlightsViewModel(service: FlightsServiceItem())
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FlightCell.self)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 20.0
        setupViewModelClosures()
        
        let header = HeaderView(frame: CGRect(x: 0, y: 70, width: tableView.bounds.width, height: 40))
        header.backgroundColor = UIColor(red: 37.0/255.0, green: 36.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        topView.backgroundColor = UIColor(red: 37.0/255.0, green: 36.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        self.topView.addSubview(header)
        
        flightsViewModel.loadInternationalDeparture()
    }
    
    private func setupViewModelClosures() {
        flightsViewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: Delegates

extension ViewController: UITableViewDelegate {
        
}

extension ViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeader(width: tableView.bounds.width)
        headerView.title.text = "19 Mayo 2021"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeReusableCell(FlightCell.self)
        
        guard let flightViewModel = flightsViewModel.getFlight(for: indexPath) else {
            return cell
        }
        cell.setup(with: flightViewModel.state.value, color: flightViewModel.stateColor)
        
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
        cell.remarks.textBond.bind(flightViewModel.state)
        
        flightViewModel.code.value = flightViewModel.code.value
        flightViewModel.airline.value = flightViewModel.airline.value
        flightViewModel.destination.value = flightViewModel.destination.value
        flightViewModel.hour.value = flightViewModel.hour.value
        flightViewModel.carousel.value = flightViewModel.carousel.value
        flightViewModel.date.value = flightViewModel.date.value
        flightViewModel.state.value = flightViewModel.state.value
        
        return cell
    }
}
