@testable import AdventOfCode
import XCTest


final class AdventOfCode2021Tests: XCTestCase {

    func testDay1() async throws {
        let data = """
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
            """.data(using: .utf8)!
        let input = ChallengeInput(data: data)

        let result = try await Challenges2021.runDay1(input: input)
        XCTAssertEqual(result.part1, "7")
        XCTAssertEqual(result.part2, "5")
    }

    func testDay2() async throws {
        let data = """
            forward 5
            down 5
            forward 8
            up 3
            down 8
            forward 2
            """.data(using: .utf8)!
        let input = ChallengeInput(data: data)

        let result = try await Challenges2021.runDay2(input: input)
        XCTAssertEqual(result.part1, "150")
        XCTAssertEqual(result.part2, "900")
    }

    func testDay3() async throws {
        let data = """
            00100
            11110
            10110
            10111
            10101
            01111
            00111
            11100
            10000
            11001
            00010
            01010
            """.data(using: .utf8)!
        let input = ChallengeInput(data: data)

        let result = try await Challenges2021.runDay3(input: input)
        XCTAssertEqual(result.part1, "198")
        XCTAssertEqual(result.part2, "230")
    }

}
