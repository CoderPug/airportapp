//
//  FlightsViewModelTests.swift
//  Airport AppTests
//
//  Created by Jose Torres on 5/17/21.
//

import XCTest
@testable import Airport_App

class FlightsViewModelTests: XCTestCase {

    private var flightsViewModel: FlightsViewModel!
    private var mockFlightsServiceItem: FlightsService!
    
    override func setUp() {
        
    }

    func testReloadTableViewClosureGetsCalled() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .empty)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        let e = expectation(description: "ReloadTableViewClosure gets called")
        flightsViewModel.reloadTableViewClosure = {
            e.fulfill()
        }
        flightsViewModel.loadInternationalArrival()
        wait(for: [e], timeout: 5.0)
    }
    
    func testGetsNilWhenGetFlightObjectInEmptyList() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .empty)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let firstElement = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssertNil(firstElement, "Expecting nil but received an Object")
    }
    
    func testSuccessfulGetFlightObjectInNonEmptyList() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .single)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let firstElement = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssert(firstElement?.code.value == "AA385", "Unexpected Flight Code value")
    }
    
    func testCorrectNumberOfItemsInEmptyList() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .empty)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let countSections = flightsViewModel.numberOfSections
        let countFlights = flightsViewModel.numberOfFlights(for: 0)
        XCTAssert(countSections == 0, "Unexpected amount of sections")
        XCTAssert(countFlights == 0, "Unexpected amount of flights")
    }
    
    func testCorrectNumberOfItemsInNonEmptyList() {
     
        mockFlightsServiceItem = MockFlightsServiceItem(type: .multiple)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let countSections = flightsViewModel.numberOfSections
        let countFlights = flightsViewModel.numberOfFlights(for: 0)
        XCTAssert(countSections == 1, "Unexpected amount of sections")
        XCTAssert(countFlights == 37, "Unexpected amount of flights")
    }
    
    func testCorrectTypeFlightAfterRequestingInternationalArrivals() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .internationalArrival)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let element = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(element, "Expecting Flight Object, but got nil")
        XCTAssert(element!.type == .arrival, "Unexpected Flight type")
        XCTAssert(element!.originType == .international, "Unexpected Origin type")
    }
    
    func testCorrectTypeFlightAfterRequestingInternationalDepartures() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .internationalDeparture)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let element = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(element, "Expecting Flight Object, but got nil")
        XCTAssert(element!.type == .departure, "Unexpected Flight type")
        XCTAssert(element!.originType == .international, "Unexpected Origin type")
    }
    
    func testCorrectTypeFlightAfterRequestingNationalArrivals() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .nationalArrival)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let element = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(element, "Expecting Flight Object, but got nil")
        XCTAssert(element!.type == .arrival, "Unexpected Flight type")
        XCTAssert(element!.originType == .national, "Unexpected Origin type")
    }
    
    func testCorrectTypeFlightAfterRequestingNationalDeparture() {
        
        mockFlightsServiceItem = MockFlightsServiceItem(type: .nationalDeparture)
        flightsViewModel = FlightsViewModel(service: mockFlightsServiceItem)
        
        flightsViewModel.loadInternationalArrival()
        let element = flightsViewModel.getFlight(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(element, "Expecting Flight Object, but got nil")
        XCTAssert(element!.type == .departure, "Unexpected Flight type")
        XCTAssert(element!.originType == .national, "Unexpected Origin type")
    }
    
}
