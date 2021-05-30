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
    
    private var topViewHeader: HeaderView?
    
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
        
        let frame = CGRect(x: 0, y: 70, width: tableView.bounds.width, height: 40)
        topViewHeader = HeaderView(frame: frame, imageName: "departure-icon")
        if let topViewHeader = topViewHeader {
            topViewHeader.backgroundColor = UIColor(red: 37.0/255.0, green: 36.0/255.0, blue: 34.0/255.0, alpha: 1.0)
            topViewHeader.delegate = self
            self.topView.addSubview(topViewHeader)
        }
        topView.backgroundColor = UIColor(red: 37.0/255.0, green: 36.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        
        flightsViewModel.loadInternationalDeparture()
        topViewHeader?.setTitle(text: FlightPresentationType.internationalDeparture.value())
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
        guard let dateText = flightsViewModel.getSectionTitle(for: section) else { return nil }
        headerView.title.text = dateText
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return flightsViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsViewModel.numberOfFlights(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeReusableCell(FlightCell.self)
        guard let flightViewModel = flightsViewModel.getFlight(for: indexPath) else {
            return cell
        }
        let type: FlightCellType = flightViewModel.type == .arrival ? .arrival : .departure
        cell.setup(for: type, with: flightViewModel.state.value, color: flightViewModel.stateColor)
        
//        let e: (String) -> Void = { element in
//            cell.code.text = element
//        }
//        let codeBond = Bond(e)
//        codeBond.bind(flightViewModel.code)
        
        cell.code.textBond.bind(flightViewModel.code)
        cell.airline.textBond.bind(flightViewModel.airline)
        cell.city.textBond.bind(flightViewModel.destination)
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
        flightViewModel.gate.value = flightViewModel.gate.value
        flightViewModel.state.value = flightViewModel.state.value
        
        return cell
    }
}

extension ViewController: HeaderViewDelegate {
    
    func headerViewOnTap(_ headerView: HeaderView) {
        let title = NSLocalizedString("Flight Types Information", comment: "Available types of flights section title")
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        for value in flightsViewModel.getFlightsPresentationTypes() {
            alert.addAction(
                UIAlertAction(title: value, style: .default, handler: refresh)
            )
        }
        let cancel = NSLocalizedString("Cancel", comment: "Cancel title")
        alert.addAction(UIAlertAction(title: cancel, style: .cancel))
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    
    private func refresh(action: UIAlertAction) {
        guard let title = action.title,
              let alertIndex = flightsViewModel.getFlightsPresentationTypes().firstIndex(of: title) else { return }
        flightsViewModel.presentationTypeSelected(alertIndex)
        topViewHeader?.setTitle(text: title)
        guard let imageName = flightsViewModel.getTopHeaderImageName(alertIndex) else { return }
        topViewHeader?.setImage(named: imageName)
    }
}
