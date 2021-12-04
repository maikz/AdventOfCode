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

        try await Challenges2021.runDay1(input: input)
    }

}
