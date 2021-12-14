import Algorithms


extension Challenges2021 {

    private static func addInsertions(for pair: String, to counts: inout [Character: Int], rules: [String: Character], remainingSteps: Int) {
        if remainingSteps == 0 { return }
        let newChar = rules[pair]!
        counts[newChar, default: 0] += 1
        let newPair1 = String([pair.first!, newChar]), newPair2 = String([newChar, pair.last!])
        addInsertions(for: newPair1, to: &counts, rules: rules, remainingSteps: remainingSteps - 1)
        addInsertions(for: newPair2, to: &counts, rules: rules, remainingSteps: remainingSteps - 1)
    }

    private static func getResult(for template: String, rules: [String: Character], steps: Int) -> Int {
        var counts = template.reduce(into: [:]) { result, character in
            result[character, default: 0] += 1
        }
        let initialPairs = template.adjacentPairs().map({ String([$0.0, $0.1]) })
        for pair in initialPairs {
            self.addInsertions(for: pair, to: &counts, rules: rules, remainingSteps: steps)
        }

        let minMax = counts.minAndMax(by: { $0.value < $1.value })!
        return minMax.max.value - minMax.min.value
    }

    @discardableResult static func runDay14(input: Input) async throws -> ChallengeResult {
        let lines = input.lines()
        let template = lines.first!
        let rules = Dictionary(uniqueKeysWithValues: lines.dropFirst().map({ rule -> (String, Character) in
            let parts = rule.replacingOccurrences(of: " -> ", with: ">").split(separator: ">").map(String.init)
            return (parts[0], parts[1].first!)
        }))


        // Part 1

        let result1 = self.getResult(for: template, rules: rules, steps: 10)
        print("Part 1: The quantity of the most common element subtracting the quantity of the least common element after 10 steps is \(result1)")


        // Part 2

        let result2 = "?"
//        let result2 = self.getResult(for: template, rules: rules, steps: 40)
//        print("Part 2: The quantity of the most common element subtracting the quantity of the least common element after 40 steps is \(result2)")


        return (part1: "\(result1)", part2: "\(result2)")
    }

}
