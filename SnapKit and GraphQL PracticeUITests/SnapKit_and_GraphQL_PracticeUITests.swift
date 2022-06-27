//
//  SnapKit_and_GraphQL_PracticeUITests.swift
//  SnapKit and GraphQL PracticeUITests
//
//  Created by Mert Tecimen on 25.06.2022.
//

import XCTest

class SnapKit_and_GraphQL_PracticeUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["Testing"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testFilterFlow() throws{
        let filterButton = app.buttons[AccessibilityIdentifiers.filterButton.rawValue]
        let filterTableView = app.tables[AccessibilityIdentifiers.filterTable.rawValue]
        let mainTableView = app.tables[AccessibilityIdentifiers.mainTable.rawValue]
        
        // Get cell count on main tableView before filtering
        // Cell count must greater before filtering.
        var mainTableViewCellCount = mainTableView.cells.count
        
        // Acces filter View
        filterButton.tap()
        XCTAssertTrue(filterTableView.exists)
        
        // Filter for "morty" tag
        let filterCell = filterTableView.cells["mortyTag"]
        filterCell.tap()
        
        // FilterView must disappear after a tag been selected.
        XCTAssertTrue(!filterTableView.exists)
        
        // Compare cell counts before and after filtering
        XCTAssertTrue(mainTableViewCellCount > mainTableView.cells.count)
        
        // Remove Filtering
        mainTableViewCellCount = mainTableView.cells.count
        filterButton.tap()
        XCTAssertTrue(filterTableView.exists)
        
        filterCell.tap()
        XCTAssertTrue(!filterTableView.exists)
        
        // Cell count must increase after filter removal.
        XCTAssertTrue(mainTableViewCellCount < mainTableView.cells.count)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
