import Algorithms


extension Challenges2021 {

    private struct CacheKey: Hashable {
        let pair: String, remainingSteps: Int
        init(_ pair: String, _ remainingSteps: Int) {
            self.pair = pair; self.remainingSteps = remainingSteps
        }
    }
    private typealias CharacterCounts = [Character: Int]

    private static var resultCache = [CacheKey: CharacterCounts]()


    private static func getInsertions(for pair: String, rules: [String: Character], remainingSteps: Int) -> CharacterCounts {
        if remainingSteps == 0 { return [:] }

        if let cached = self.resultCache[CacheKey(pair, remainingSteps)] { return cached }

        let newChar = rules[pair]!

        let newPair1 = String([pair.first!, newChar]), newPair2 = String([newChar, pair.last!])
        let pair1Result = getInsertions(for: newPair1, rules: rules, remainingSteps: remainingSteps - 1)
        let pair2Result = getInsertions(for: newPair2, rules: rules, remainingSteps: remainingSteps - 1)
        var result = pair1Result.merging(other: pair2Result)
        result[newChar, default: 0] += 1

        self.resultCache[CacheKey(pair, remainingSteps)] = result

        return result
    }

    private static func getResult(for template: String, rules: [String: Character], steps: Int) -> Int {
        var counts = template.reduce(into: [:]) { result, character in
            result[character, default: 0] += 1
        }
        let initialPairs = template.adjacentPairs().map({ String([$0.0, $0.1]) })
        for pair in initialPairs {
            counts = counts.merging(other: self.getInsertions(for: pair, rules: rules, remainingSteps: steps))
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

        let result2 = self.getResult(for: template, rules: rules, steps: 40)
        print("Part 2: The quantity of the most common element subtracting the quantity of the least common element after 40 steps is \(result2)")


        return (part1: "\(result1)", part2: "\(result2)")
    }

}


private extension Dictionary where Key == Character, Value == Int {

    func merging(other: Self) -> Self {
        self.reduce(other) { partialResult, new in
            var result = partialResult
            result[new.key, default: 0] += new.value
            return result
        }
    }

}
