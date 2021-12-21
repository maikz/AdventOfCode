import Algorithms
import Foundation


extension Challenges2021 {

    private static var diracDistribution: [Int: UInt64] = {
        let permutations = product(1...3, product(1...3, 1...3)).map({ ($0, $1.0, $1.1) })
        return permutations.reduce([Int: UInt64]()) { partialResult, permutation in
            let sum = permutation.0 + permutation.1 + permutation.2
            var result = partialResult
            result[sum, default: 0] += 1
            return result
        }
    }()

    private struct DeterministicDie {
        private var state = 0
        var rollCount = 0

        mutating func roll() -> Int {
            self.state = (self.state % 100) + 1
            self.rollCount += 1
            return self.state
        }

        mutating func roll(_ count: Int) -> Int {
            return (1...count).reduce(0) { sum, _ in sum + self.roll() }
        }
    }

    private struct Player {
        var score = 0
        var position: Int

        init(position: Int) {
            self.position = position
        }

        @discardableResult mutating func move(by count: Int) -> Int {
            self.position = ((self.position + count - 1) % 10) + 1
            self.score += self.position
            return self.score
        }

        func moved(by count: Int) -> Self {
            var copy = self
            copy.move(by: count)
            return copy
        }
    }

    private static func countUniverses(p1: Player, p2: Player, next: UInt8) -> (p1: UInt64, p2: UInt64) {
        if p1.score >= 21 { return (1, 0) }
        if p2.score >= 21 { return (0, 1) }

        return diracDistribution.reduce((p1: 0, p2: 0)) { partial, diceValues in
            let subScore: (p1: UInt64, p2: UInt64)
            switch next {
                case 1: subScore = countUniverses(p1: p1.moved(by: diceValues.key), p2: p2, next: 2)
                case 2: subScore = countUniverses(p1: p1, p2: p2.moved(by: diceValues.key), next: 1)
                default: fatalError()
            }
            return (p1: partial.p1 + diceValues.value * subScore.p1,
                    p2: partial.p2 + diceValues.value * subScore.p2)
        }
    }

    @discardableResult static func runDay21(input: Input) async throws -> ChallengeResult {
        let input = input.asString()
        let patter = #"(\d+)$"#
        let regex = try! NSRegularExpression(pattern: patter, options: [.anchorsMatchLines])
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
        let p1StartRange = Range(matches.first!.range(at: 1), in: input)!
        let p1Start = Int(String(input[p1StartRange]))!
        let p2StartRange = Range(matches.last!.range(at: 1), in: input)!
        let p2Start = Int(String(input[p2StartRange]))!


        // Part 1

        var p1 = Player(position: p1Start)
        var p2 = Player(position: p2Start)
        var die = DeterministicDie()

        var result1 = -1
        while true {
            if p1.move(by: die.roll(3)) >= 1000 {
                result1 = p2.score * die.rollCount
                break
            }
            if p2.move(by: die.roll(3)) >= 1000 {
                result1 = p1.score * die.rollCount
                break
            }
        }

        print("Part 1: The product of the score of the losing player and the number of times the die was rolled is \(result1).")


        // Part 2

        let counts = self.countUniverses(p1: Player(position: p1Start), p2: Player(position: p2Start), next: 1)
        let result2 = max(counts.p1, counts.p2)

        print("Part 2: The winning player wins in \(result2) universes.")

        return (part1: "\(result1)", part2: "\(result2)")
    }

}
