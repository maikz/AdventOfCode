extension Challenges2021 {

    private struct Swarm {
        let timer: Int
        let count: Int

        /// Returns the next set of fishes produced after one time tick.
        func tick() -> [Self] {
            if self.timer == 0 {
                return [self.reset(), self.offspring()]
            } else {
                return [self.reduced()]
            }
        }

        func reduced() -> Self {
            return Self(timer: self.timer - 1, count: self.count)
        }
        func reset() -> Self {
            return Self(timer: 6, count: self.count)
        }
        func offspring() -> Self {
            return Self(timer: 8, count: self.count)
        }
        func addingCount(_ count: Int) -> Self {
            return Self(timer: self.timer, count: self.count + count)
        }
    }


    private static func getTotal(of fishes: [Swarm], after days: Int) -> Int {
        var currentFishes = fishes
        for _ in 1...days {
            // tick forward
            let newFishes = currentFishes.flatMap({ $0.tick() })
            // always group fishes by their timer, so what we have a max of 9 fish swarms
            // that we need need to keep track of at a time
            currentFishes = newFishes.reduce([Swarm]()) { partialResult, fish in
                var result = partialResult
                if let index = result.firstIndex(where: { $0.timer == fish.timer }) {
                    // combine the swarms
                    result[index] = result[index].addingCount(fish.count)
                } else {
                    result.append(fish)
                }
                return result
            }
        }
        return currentFishes.reduce(0, { $0 + $1.count })
    }

    @discardableResult static func runDay6(input: ChallengeInput) async throws -> ChallengeResult {
        // parse "fishes" and group them by there inner timer
        let rawFishes = input.lines()!.first!.split(separator: ",").map({ Int(String($0))! }).reduce(into: [:]) { result, timer in
            result[timer, default: 0] += 1
        }
        let fishes = rawFishes.map({ Swarm(timer: $0.key, count: $0.value) })

        let total1 = self.getTotal(of: fishes, after: 80)
        print("Part 1: There are \(total1) lanternfish after 80 days.")

        let total2 = self.getTotal(of: fishes, after: 256)
        print("Part 2: There are \(total2) lanternfish after 256 days.")

        return (part1: "\(total1)", part2: "\(total2)")
    }

}
