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

    private var elements: [[Element]]

    var width: Int {
        return self.elements.first?.count ?? 0
    }
    var height: Int {
        return self.elements.count
    }

    init(_ elements: [[Element]]) {
        self.elements = elements
    }

    subscript(_ x: Int, _ y: Int) -> Point {
        return Point(x: x, y: y, value: self.elements[y][x])
    }

    subscript(_ x: Int, _ y: Int) -> Element {
        get { return self.elements[y][x] }
        set { self.elements[y][x] = newValue }
    }

    var allPoints: [Point] {
        product(0...self.width-1, 0...self.height-1).map { self[$0.0, $0.1] }
    }
    var allValues: [Element] {
        self.allPoints.map(\.value)
    }

    func getDirectNeighbors(_ x: Int, _ y: Int) -> Set<Point> {
        var result = Set<Point>()
        if x > 0 { result.insert(self[x-1, y]) }
        if y > 0 { result.insert(self[x, y-1]) }
        if x < self.width-1 { result.insert(self[x+1, y]) }
        if y < self.height-1 { result.insert(self[x, y+1]) }
        return result
    }

    func getDirectNeighbors(_ point: Point) -> Set<Point> {
        return self.getDirectNeighbors(point.x, point.y)
    }

    func getNeighbors(_ x: Int, _ y: Int) -> Set<Point> {
        let xRange = Swift.max(0, x-1)...Swift.min(self.width-1, x+1)
        let yRange = Swift.max(0, y-1)...Swift.min(self.height-1, y+1)
        var result = Set<Point>()
        for currentX in xRange {
            for currentY in yRange {
                if currentX == x, currentY == y { continue }
                result.insert(self[currentX, currentY])
            }
        }
        return result
    }

    func getNeighbors(_ point: Point) -> Set<Point> {
        return self.getNeighbors(point.x, point.y)
    }

}
