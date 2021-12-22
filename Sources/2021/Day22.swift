import Algorithms
import Foundation


extension Challenges2021 {

    private struct Reactor {

        enum State {
            case on, off
            var isOn: Bool { self == .on }
        }

        private let cubeStorage: UnsafeMutablePointer<State>
        private var cubeBuffer: UnsafeMutableBufferPointer<State> {
            UnsafeMutableBufferPointer<State>(start: self.cubeStorage, count: self.capacity)
        }

        let xRange, yRange, zRange: ClosedRange<Int>

        var width: Int { self.xRange.count }
        var height: Int { self.yRange.count }
        var depth: Int { self.zRange.count }
        var capacity: Int { self.width * self.height * self.depth }

        var allStates: [State] {
            return Array(self.cubeBuffer)
        }

        init(xRange: ClosedRange<Int>, yRange: ClosedRange<Int>, zRange: ClosedRange<Int>) {
            self.xRange = xRange; self.yRange = yRange; self.zRange = zRange
            let capacity = xRange.count * yRange.count * zRange.count
            self.cubeStorage = UnsafeMutablePointer<State>.allocate(capacity: capacity)
            self.cubeStorage.initialize(repeating: .off, count: capacity)
        }

        subscript(_ x: Int, _ y: Int, _ z: Int) -> State? {
            get {
                guard self.xRange.contains(x), self.yRange.contains(y), self.zRange.contains(z)
                else { return nil }
                let index = (z-zRange.lowerBound) * height * width + (y-yRange.lowerBound) * width + (x-xRange.lowerBound)
                return self.cubeStorage[index]
            }
            set {
                guard let newValue = newValue, self.xRange.contains(x), self.yRange.contains(y), self.zRange.contains(z)
                else { return }
                let index = (z-zRange.lowerBound) * height * width + (y-yRange.lowerBound) * width + (x-xRange.lowerBound)
                self.cubeStorage[index] = newValue
            }
        }

        mutating func apply(_ instruction: Instruction) {
            guard instruction.xRange.overlaps(self.xRange),
                  instruction.yRange.overlaps(self.yRange),
                  instruction.zRange.overlaps(self.zRange)
            else { return }

            for x in instruction.xRange {
                for y in instruction.yRange {
                    for z in instruction.zRange {
                        self[x, y, z] = instruction.newState
                    }
                }
            }
        }

    }

    private struct Instruction {
        let newState: Reactor.State
        let xRange, yRange, zRange: ClosedRange<Int>

        init(string: String) {
            // on x=10..12,y=10..12,z=10..12
            let patter = #"(on|off) x=(-?\d+)..(-?\d+),y=(-?\d+)..(-?\d+),z=(-?\d+)..(-?\d+)"#
            let regex = try! NSRegularExpression(pattern: patter, options: [])

            let match = regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count))!
            let instruction = String(string[Range(match.range(at: 1), in: string)!])
            let xLower = Int(String(string[Range(match.range(at: 2), in: string)!]))!
            let xUpper = Int(String(string[Range(match.range(at: 3), in: string)!]))!
            let yLower = Int(String(string[Range(match.range(at: 4), in: string)!]))!
            let yUpper = Int(String(string[Range(match.range(at: 5), in: string)!]))!
            let zLower = Int(String(string[Range(match.range(at: 6), in: string)!]))!
            let zUpper = Int(String(string[Range(match.range(at: 7), in: string)!]))!

            switch instruction {
                case "on": self.newState = .on
                case "off": self.newState = .off
                default: fatalError()
            }
            self.xRange = xLower...xUpper
            self.yRange = yLower...yUpper
            self.zRange = zLower...zUpper
        }
    }



    @discardableResult static func runDay22(input: Input) async throws -> ChallengeResult {
        let instructions = input.lines().map(Instruction.init)

        // Part 1

        var reactor = Reactor(xRange: -50...50, yRange: -50...50, zRange: -50...50)
        for instruction in instructions {
            reactor.apply(instruction)
        }
        let onCount = reactor.allStates.filter(\.isOn).count

        print("Part 1: \(onCount) cubes are on.")


        // Part 2

        let xRange = instructions.map(\.xRange.lowerBound).min()!...instructions.map(\.xRange.upperBound).max()!
        let yRange = instructions.map(\.yRange.lowerBound).min()!...instructions.map(\.yRange.upperBound).max()!
        let zRange = instructions.map(\.zRange.lowerBound).min()!...instructions.map(\.zRange.upperBound).max()!

        var reactor2 = Reactor(xRange: xRange, yRange: yRange, zRange: zRange)
        for instruction in instructions {
            reactor2.apply(instruction)
        }
        let onCount2 = reactor2.allStates.filter(\.isOn).count

        print("Part 2: \(onCount2) cubes are on.")


        return (part1: "\(onCount)", part2: "\(onCount2)")
    }

}
