extension Challenges2021 {

    private struct Point {
        let x: Int, y: Int

        init(_ string: String) {
            let components = string.split(separator: ",")
            self.x = Int(components[0])!
            self.y = Int(components[1])!
        }
    }

    private struct Line {
        let from: Point, to: Point

        init(_ string: String) {
            let components = string.replacingOccurrences(of: " -> ", with: ">").split(separator: ">").map(String.init)
            self.from = Point(components[0])
            self.to = Point(components[1])
        }

        var isStraight: Bool {
            return from.x == to.x || from.y == to.y
        }

        var xValues: [Int] {
            if self.from.x != self.to.x {
                if self.from.x < self.to.x {
                    return Array(self.from.x...self.to.x)
                } else {
                    return Array(self.to.x...self.from.x).reversed()
                }
            } else {
                return Array(repeating: self.from.x, count: self.yValues.count)
            }
        }
        var yValues: [Int] {
            if self.from.y != self.to.y {
                if self.from.y < self.to.y {
                    return Array(self.from.y...self.to.y)
                } else {
                    return Array(self.to.y...self.from.y).reversed()
                }
            } else {
                return Array(repeating: self.from.y, count: self.xValues.count)
            }
        }
        var points: [(Int, Int)] {
            return Array(zip(self.xValues, self.yValues))
        }
    }

    private struct Board: CustomStringConvertible {

        var fields: [[Int]]

        init(size: Int) {
            self.fields = Array(repeating: Array(repeating: 0, count: size), count: size)
        }

        mutating func mark(line: Line) {
            for (x, y) in line.points {
                self.fields[y][x] += 1
            }
        }

        var description: String {
            let lines = self.fields.map({ $0.map(String.init).map({ $0 == "0" ? "." : $0 }).joined() })
            return lines.joined(separator: "\n")
        }

        var numDangerAreas: Int {
            return self.fields.flatMap({ $0 }).filter({ $0 > 1 }).count
        }

    }


    @discardableResult static func runDay5(input: ChallengeInput) async throws -> ChallengeResult {
        let lines = input.lines()!.map(Line.init)


        // Part 1

        let straightLines = lines.filter(\.isStraight)
        var board1 = Board(size: 1000)

        for line in straightLines {
            board1.mark(line: line)
        }
        let numDangerAreas1 = board1.numDangerAreas
        print("Part 1: At \(numDangerAreas1) points do at least two straight lines overlap.")


        // Part 2

        var board2 = Board(size: 1000)

        for line in lines {
            board2.mark(line: line)
        }
        let numDangerAreas2 = board2.numDangerAreas
        print("Part 2: At \(numDangerAreas2) points do at least two lines overlap.")

        return ("\(numDangerAreas1)", "\(numDangerAreas2)")
    }

}
