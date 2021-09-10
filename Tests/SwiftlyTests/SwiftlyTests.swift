import XCTest
@testable import Swiftly

final class AnyFormatterTests: XCTestCase {
    
    func test_kmFormatt() {
        let sut: Float = 10482.0210
        let sutOne: Float = 10.0210
        XCTAssertEqual(sut.kmFormatt(), "10.482")
        XCTAssertEqual(sutOne.kmFormatt(), "0.010")
    }

    func test_msTimeFormatter() {
        let sut: Float = 104811212
        let sutOne: Float = 901011212
        XCTAssertEqual(sut.msTimeFormatter(), "1g:5h")
        XCTAssertEqual(sutOne.msTimeFormatter(), "10g:10h")
    }
}
