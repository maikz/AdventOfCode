import Foundation


extension Challenges2021 {

    private enum Instruction {
        case forward(steps: Int)
        case down(steps: Int)
        case up(steps: Int)

        init?(string: String) {
            let patter = #"^(forward|down|up)\s(\d+)$"#
            let regex = try! NSRegularExpression(pattern: patter, options: [])

            if let match = regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) {
                if let instructionRange = Range(match.range(at: 1), in: string), let stepRange = Range(match.range(at: 2), in: string) {
                    let instruction = String(string[instructionRange])
                    let steps = Int(String(string[stepRange]))!

                    switch instruction {
                        case "forward": self = .forward(steps: steps)
                        case "down": self = .down(steps: steps)
                        case "up": self = .up(steps: steps)
                        default: return nil
                    }
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
    }


    static func runDay2(input: ChallengeInput) async throws {
        guard let instructions = input.lines()?.compactMap(Instruction.init) else {
            throw AdventOfCode.RuntimeError.parsingError
        }

        var horizontal = 0, depth = 0
        for instruction in instructions {
            switch instruction {
                case .forward(let steps): horizontal += steps
                case .down(let steps): depth += steps
                case .up(let steps): depth -= steps
            }
        }
        print("Part 1: Horizontal = \(horizontal), Depth = \(depth) -> Solution = \(horizontal * depth)")

        horizontal = 0; depth = 0; var aim = 0
        for instruction in instructions {
            switch instruction {
                case .forward(let steps):
                    horizontal += steps
                    depth += aim * steps
                case .down(let steps): aim += steps
                case .up(let steps): aim -= steps
            }
        }
        print("Part 2: Horizontal = \(horizontal), Depth = \(depth) -> Solution = \(horizontal * depth)")
    }

}
