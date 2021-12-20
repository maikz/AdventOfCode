import Algorithms


struct Grid<Element> {

    struct Point: Hashable {
        let x: Int, y: Int, value: Element

        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(self.x)
            hasher.combine(self.y)
        }
    }

    var elements: [[Element]]

    let padding: Element?

    var width: Int {
        return self.elements.first?.count ?? 0
    }
    var height: Int {
        return self.elements.count
    }

    init(_ elements: [[Element]], padding: Element? = nil) {
        self.elements = elements
        self.padding = padding
    }

    subscript(_ x: Int, _ y: Int) -> Point? {
        guard self.elements.indices.contains(y), self.elements[0].indices.contains(x) else {
            return self.padding.map({ Point(x: x, y: y, value: $0) }) ?? nil
        }
        return Point(x: x, y: y, value: self.elements[y][x])
    }

    subscript(_ x: Int, _ y: Int) -> Element? {
        return self[x, y]?.value
    }

    var allPoints: [Point] {
        product(0...self.width-1, 0...self.height-1).compactMap { self[$0.0, $0.1] }
    }
    var allValues: [Element] {
        self.allPoints.map(\.value)
    }

    func getDirectNeighbors(_ x: Int, _ y: Int) -> Set<Point> {
        return Set<Point>([
            self[x-1, y],
            self[x, y-1],
            self[x+1, y],
            self[x, y+1],
        ].compacted())
    }

    func getDirectNeighbors(_ point: Point) -> Set<Point> {
        return self.getDirectNeighbors(point.x, point.y)
    }

    func getNeighbors(_ x: Int, _ y: Int) -> Set<Point> {
        var result = [Point?]()
        for currentX in x-1...x+1 {
            for currentY in y-1...y+1 {
                if currentX == x, currentY == y { continue }
                result.append(self[currentX, currentY])
            }
        }
        return Set(result.compacted())
    }

    func getNeighbors(_ point: Point) -> Set<Point> {
        return self.getNeighbors(point.x, point.y)
    }

}

extension Grid: CustomStringConvertible where Element: CustomStringConvertible {

    var description: String {
        self.elements.map({ $0.map(\.description).joined() }).joined(separator: "\n")
    }

}
