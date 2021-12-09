extension Challenges2021 {

    private struct HeightMap {

        struct Point: Hashable {
            let row, column, value: Int
        }


        private let field: [[Int]]

        init(_ field: [[Int]]) {
            self.field = field
        }

        subscript(_ row: Int, _ column: Int) -> Point {
            get {
                return Point(row: row, column: column, value: self.field[row][column])
            }
        }

        private func getAdjacentPoints(_ row: Int, _ column: Int) -> Set<Point> {
            var result = Set<Point>()
            if row > 0 { result.insert(self[row-1, column]) }
            if column > 0 { result.insert(self[row, column-1]) }
            if row < field.count-1 { result.insert(self[row+1, column]) }
            if column < field[row].count-1 { result.insert(self[row, column+1]) }

            return result
        }

        var lowPoints: [Point] {
            var lowPoints = [Point]()
            for row in 0..<self.field.count {
                for column in 0..<self.field[row].count {
                    let point = self[row, column]
                    let adjacent = self.getAdjacentPoints(row, column)
                    if adjacent.allSatisfy({ $0.value > point.value }) { lowPoints.append(point) }
                }
            }
            return lowPoints
        }

        func basin(of lowPoint: Point) -> Set<Point> {
            var basinPoints: Set<Point> = []
            var newPoints: Set<Point> = [lowPoint]
            while !newPoints.isEmpty {
                basinPoints = basinPoints.union(newPoints)
                newPoints = newPoints.reduce(Set<Point>(), { partialResult, point in
                    let adjacent = self.getAdjacentPoints(point.row, point.column)
                    let increasing = adjacent.filter({ $0.value < 9 && $0.value > point.value })
                    let unseen = increasing.subtracting(basinPoints)
                    return partialResult.union(unseen)
                })
            }

            return basinPoints
        }


    }

    @discardableResult static func runDay9(input: ChallengeInput) async throws -> ChallengeResult {
        let heightMap = HeightMap(input.lines()!.map({ $0.map({ Int(String($0))! }) }))


        // Part 1

        let lowPoints = heightMap.lowPoints
        let riskLevels = lowPoints.map({ $0.value + 1 })
        let riskSum = riskLevels.reduce(0, +)

        print("Part 1: The sum of the risk levels of all low points on the heightmap is \(riskSum).")


        // Part 2

        let basins = lowPoints.map({ heightMap.basin(of: $0) })
        let largestBasins = basins.max(count: 3, sortedBy: { $0.count < $1.count })
        let sizeProduct = largestBasins.reduce(1, { $0 * $1.count })

        print("Part 2: The product of the sizes of the three largest basins is \(sizeProduct)")

        return (part1: "\(riskSum)", part2: "\(sizeProduct)")
    }

}
