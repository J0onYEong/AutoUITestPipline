import XCTest
@testable import Junios

final class JuniosTests: XCTestCase {

    func test플러스원테스트() throws {
        // Given
        let sut = HelloModel()

        // When
        let result = sut.plusOne(to: 1)

        // Then
        XCTAssertEqual(result, 2)
    }

    func test더하기테스트() throws {
        let a = 2
        let b = 3
        XCTAssertEqual(a + b, 5)
    }

    func test문자열테스트() throws {
        let str = "Hello"
        XCTAssertEqual(str.count, 5)
    }

    func test배열테스트() throws {
        let arr = [1, 2, 3]
        XCTAssertTrue(arr.contains(2))
    }

    func test불리언테스트() throws {
        let flag = true
        XCTAssertTrue(flag)
    }

}
