//
//  rxUnitTestTests.swift
//  rxUnitTestTests
//
//  Created by 노영재(Youngjae No)_인턴 on 3/25/24.
//

import XCTest
import RxSwift
@testable import rxUnitTest

final class rxUnitTestTests: XCTestCase {
    var disposeBag: DisposeBag!
    var sut: ViewReactor!
    
    override func setUp() {
        disposeBag = DisposeBag()
        sut = ViewReactor()
    }
    
    func test_WhenTapPlusButton_ThenPlusCount() {
        // Given
        let reactor = sut!
        let expectation = XCTestExpectation(description: "test_WhenTapPlusButton_ThenPlusCount")
        
        // When - tap plus button
        reactor.action.onNext(.tapPlusButton)
        
        // Then - cnt is one
        reactor.state.map(\.cnt)
            .subscribe { item in
                guard item == 1 else { return }
                expectation.fulfill()
            }
            .disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 3)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
