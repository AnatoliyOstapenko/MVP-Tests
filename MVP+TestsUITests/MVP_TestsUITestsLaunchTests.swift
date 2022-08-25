//
//  MVP_TestsUITestsLaunchTests.swift
//  MVP+TestsUITests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import XCTest

class MVP_TestsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    
}
class Solution {
    func solution(_ num: Int) -> Int {
      return 0
    }
}



class SolutionTest: XCTestCase {
    func testSolution() {
        // Assert
        let solutionObject = Solution()
        let num = 10
        // Act
        let result = solutionObject.solution(num)
        
        XCTAssertEqual(result, 23)
//        XCTAssertEqual(solution(10), 23)
//        XCTAssertEqual(solution(20), 78)
//        XCTAssertEqual(solution(200), 9168)
    }
}

