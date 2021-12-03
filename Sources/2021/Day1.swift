import Algorithms


extension Challenges2021 {

    static func runDay1(input: ChallengeInput) async throws {
        let lines = input.lines()!.compactMap(UInt.init)

        let numDeclines1 = self.countSlopes(in: lines, windowSize: 1)
        print("Part 1: There are \(numDeclines1) declining slopes ahead.")

        let numDeclines2 = self.countSlopes(in: lines, windowSize: 3)
        print("Part 2: Looks more like \(numDeclines2) declining slopes ahead.")
    }

    private static func countSlopes<C: Collection>(in lines: C, windowSize: Int) -> Int where C.Element == UInt {
        let windowSums = lines.windows(ofCount: windowSize).map({ $0.reduce(0, +) })
        return windowSums.adjacentPairs().filter({ $0 < $1 }).count
    }

}
