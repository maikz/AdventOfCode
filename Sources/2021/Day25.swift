private extension Grid where Element == Character {

    func next(for point: Point) -> Point {
        self[(point.x + (point.value == ">" ? 1 : 0)) % self.width,
             (point.y + (point.value == "v" ? 1 : 0)) % self.height]!
    }

    func movables(_ type: Character) -> [Point] {
        self.allPoints.filter({ $0.value == type }).filter({ self.next(for: $0).value == "." })
    }

    mutating func move(_ points: [Point]) {
        for point in points {
            let next = self.next(for: point)
            self[next.x, next.y] = point.value
            self[point.x, point.y] = "."
        }
    }

    mutating func step() -> Bool {
        let leftMovables = self.movables(">")
        self.move(leftMovables)
        let rightMovables = self.movables("v")
        self.move(rightMovables)

        return !leftMovables.isEmpty || !rightMovables.isEmpty
    }

}


extension Challenges2021 {

    @discardableResult static func runDay25(input: Input) async throws -> ChallengeResult {
        let lines = input.lines()
        let tiles = lines.map({ Array($0) })

        var floor = Grid(tiles)
        var stepCount = 1
        while floor.step() {
            stepCount += 1
        }

        print("\(stepCount) is the first step on which no sea cucumbers move.")


        return (part1: "\(stepCount)", part2: "")
    }

}
