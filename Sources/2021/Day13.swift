import Foundation


extension Challenges2021 {

    private struct Dot: Hashable {
        let x, y: Int

        init(x: Int, y: Int) {
            self.x = x; self.y = y
        }

        init(_ string: String) {
            let components = string.split(separator: ",")
            self.x = Int(components.first!)!
            self.y = Int(components.last!)!
        }

        func apply(instruction: String) -> Self {
            let patter = #"(x|y)=(\d+)"#
            let regex = try! NSRegularExpression(pattern: patter, options: [])

            let match = regex.firstMatch(in: instruction, options: [], range: NSRange(location: 0, length: instruction.count))!
            let axisRange = Range(match.range(at: 1), in: instruction)!
            let positionRange = Range(match.range(at: 2), in: instruction)!
            let axis = String(instruction[axisRange])
            let position = Int(String(instruction[positionRange]))!

            switch axis {
                case "x":
                    if self.x <= position { return self }
                    else {
                        let distanceToFold = self.x - position
                        return Dot(x: self.x - 2 * distanceToFold, y: self.y)
                    }
                case "y":
                    if self.y <= position { return self }
                    else {
                        let distanceToFold = self.y - position
                        return Dot(x: self.x, y: self.y - 2 * distanceToFold)
                    }
                default: return self
            }
        }

        static func plot(dots: Set<Dot>) -> String {
            let maxX = dots.map(\.x).max()!
            let maxY = dots.map(\.y).max()!
            var lines = Array(repeating: Array(repeating: ".", count: maxX+1), count: maxY+1)

            for dot in dots {
                lines[dot.y][dot.x] = "#"
            }

            return lines.map({ $0.joined() }).joined(separator: "\n")
        }
    }

    @discardableResult static func runDay13(input: Input) async throws -> ChallengeResult {
        let lines = input.lines()
        let instructionStart = lines.firstIndex(where: { $0.hasPrefix("fold") })!
        let dots = lines[0..<instructionStart].map(Dot.init)
        let instructions = lines[instructionStart...]


        // Part 1

        let foldedDots = dots.map({ $0.apply(instruction: instructions.first!) })
        let numUniqueDots = Set(foldedDots).count

        print("Part 1: There are \(numUniqueDots) dots after completing just the first fold instruction on the transparent paper.")


        // Part 2

        var currentDots = Set(dots)
        for instruction in instructions {
            let newDots = currentDots.map({ $0.apply(instruction: instruction) })
            currentDots = Set(newDots)
        }
        let pattern = Dot.plot(dots: currentDots)

        print("Part 2: The pattern looks like this:")
        print("")
        print(pattern)

        return (part1: "\(numUniqueDots)", part2: pattern)
    }

}
