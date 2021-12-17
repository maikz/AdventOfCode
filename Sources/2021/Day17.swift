import Algorithms
import Foundation


extension Challenges2021 {

    private final class Probe {
        var x = 0, y = 0
        var xVelocity, yVelocity: Int
        var maxY = 0

        init(xVelocity: Int, yVelocity: Int) {
            self.xVelocity = xVelocity
            self.yVelocity = yVelocity
        }

        func step() {
            self.x += xVelocity
            self.y += yVelocity
            self.xVelocity -= self.xVelocity.signum()
            self.yVelocity -= 1
            self.maxY = max(self.maxY, self.y)
        }

        func isInside(_ target: Target) -> Bool {
            return target.xRange.contains(self.x) && target.yRange.contains(self.y)
        }

        func didMiss(_ target: Target) -> Bool {
            return self.x > target.xRange.upperBound || self.y < target.yRange.lowerBound
        }
    }

    private struct Target {
        let xRange: ClosedRange<Int>
        let yRange: ClosedRange<Int>
    }

    @discardableResult static func runDay17(input: Input) async throws -> ChallengeResult {
        let input = input.asString()
        let patter = #"x=(-?\d+)..(-?\d+), y=(-?\d+)..(-?\d+)"#
        let regex = try! NSRegularExpression(pattern: patter, options: [])
        let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count))!

        let targetMinX = Int(String(input[Range(match.range(at: 1), in: input)!]))!
        let targetMaxX = Int(String(input[Range(match.range(at: 2), in: input)!]))!
        let targetMinY = Int(String(input[Range(match.range(at: 3), in: input)!]))!
        let targetMaxY = Int(String(input[Range(match.range(at: 4), in: input)!]))!
        let target = Target(xRange: targetMinX...targetMaxX, yRange: targetMinY...targetMaxY)


        let probes = product((1...target.xRange.upperBound), (target.yRange.lowerBound...1000)).map({ Probe(xVelocity: $0, yVelocity: $1) })

        let hittingProbes = probes.compactMap { probe -> Probe? in
            while !probe.didMiss(target) {
                if probe.isInside(target) { return probe }
                probe.step()
            }
            return nil
        }
        let probesMaxY = hittingProbes.map(\.maxY).max()!

        print("Part 1: The highest y position any probe reaches on this trajectory is \(probesMaxY).")
        print("Part 2: There are \(hittingProbes.count) distinct initial velocity values that cause the probe to be within the target area after any step.")


        return (part1: "\(probesMaxY)", part2: "\(hittingProbes.count)")
    }

}
