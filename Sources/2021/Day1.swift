extension Challenges2021 {

    static func runDay1() throws {
        let lines = self.input.split(separator: "\n").map(String.init).compactMap(UInt.init)
        let numDeclines1 = zip(lines.dropLast(), lines.dropFirst()).filter({ $0 < $1 }).count
        print("Part 1: There are \(numDeclines1) declining slopes ahead.")

        let windowSize = 3
        let windowSums = lines.dropLast(windowSize - 1).indices.map({ lines[$0...($0 + windowSize - 1)].reduce(0, +) })
        let numDeclines2 = zip(windowSums.dropLast(), windowSums.dropFirst()).filter({ $0 < $1 }).count
        print("Part 2: Looks more like \(numDeclines2) declining slopes ahead.")
    }

    // Temporary solution. Working on fetching inputs from the server.
    private static var input: String {
        // 👇 your data goes here
        """

        """
    }

}
