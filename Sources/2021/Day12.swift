extension Challenges2021 {

    private final class Cave: Hashable {

        let name: String
        var connections = [Cave]()

        var isSmall: Bool { self.name == self.name.lowercased() }
        var isLarge: Bool { self.name == self.name.uppercased() }
        var isStart: Bool { self.name == "start" }
        var isEnd: Bool { self.name == "end" }

        init(name: String) {
            self.name = name
        }

        static func == (lhs: Cave, rhs: Cave) -> Bool {
            lhs.name == rhs.name
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(self.name)
        }

        static func buildNetwork(from input: [String]) -> Cave {
            let rawCaveConnections = input.map({ $0.split(separator:"-").map(String.init) })
            let uniqueCaves = Dictionary(uniqueKeysWithValues: Set(rawCaveConnections.flatMap({ $0 })).map({ ($0, Cave(name: $0)) }))
            let connections = rawCaveConnections.map({ (uniqueCaves[$0.first!]!, uniqueCaves[$0.last!]!) })
            for (from, to) in connections {
                from.connections.append(to)
                to.connections.append(from)
            }

            return uniqueCaves["start"]!
        }

    }

    private typealias CaveChecker = (_ nextCave: Cave, _ alreadyVisited: [Cave]) -> Bool

    private static func findPaths(from currentCave: Cave, alreadyVisited: [Cave], caveCheck: CaveChecker) -> [[Cave]] {
        let alreadyVisited = alreadyVisited + [currentCave]

        var foundPaths = [[Cave]]()
        for nextCave in currentCave.connections {
            if nextCave.isEnd {
                foundPaths.append(alreadyVisited + [nextCave])
            } else if caveCheck(nextCave, alreadyVisited) {
                foundPaths.append(contentsOf: findPaths(from: nextCave, alreadyVisited: alreadyVisited, caveCheck: caveCheck))
            } else {
                // ignore
                continue
            }
        }
        return foundPaths
    }

    private static func caveCheckPart1(nextCave: Cave, alreadyVisited: [Cave]) -> Bool {
        return !(nextCave.isSmall && alreadyVisited.contains(nextCave))
    }

    private static func caveCheckPart2(nextCave: Cave, alreadyVisited: [Cave]) -> Bool {
        if nextCave.isStart { return false }
        if nextCave.isLarge { return true }

        // check if any small cave was visited twice already
        let smallCaves = alreadyVisited.filter(\.isSmall)
        let alreadyTwice = Set(smallCaves).count != smallCaves.count
        if !alreadyTwice {
            return true
        } else {
            return !alreadyVisited.contains(nextCave)
        }

    }

    @discardableResult static func runDay12(input: Input) async throws -> ChallengeResult {
        let startCave = Cave.buildNetwork(from: input.lines())


        // Part 1

        let paths1 = self.findPaths(from: startCave, alreadyVisited: [], caveCheck: caveCheckPart1)
        let numPaths1 = paths1.count

        print("Part 1: There are \(numPaths1) paths through this cave system that visit small caves at most once.")


        // Part 2

        let paths2 = self.findPaths(from: startCave, alreadyVisited: [], caveCheck: caveCheckPart2)
        let numPaths2 = paths2.count

        print("Part 2: There are \(numPaths2) paths through this cave system that visit small caves at most once and one twice.")


        return (part1: "\(numPaths1)", part2: "\(numPaths2)")
    }

}
