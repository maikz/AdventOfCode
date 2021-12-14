@testable import AdventOfCode
import XCTest


final class AdventOfCode2021Tests: XCTestCase {

    func testDay1() async throws {
        let input = TestInput(string: """
            199
            200
            208
            210
            200
            207
            240
            269
            260
            263
            """)
        let result = try await Challenges2021.runDay1(input: input)
        XCTAssertEqual(result.part1, "7")
        XCTAssertEqual(result.part2, "5")
    }

}
