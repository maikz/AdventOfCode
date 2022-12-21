import Foundation


extension Challenges2021 {

    private struct ALU {

        typealias Register = Character

        enum Instruction {
            case inp(a: Register)
            case add(a: Register, b: Register)
            case addv(a: Register, v: Int)
            case mul(a: Register, b: Register)
            case mulv(a: Register, v: Int)
            case div(a: Register, b: Register)
            case divv(a: Register, v: Int)
            case mod(a: Register, b: Register)
            case modv(a: Register, v: Int)
            case eql(a: Register, b: Register)
            case eqlv(a: Register, v: Int)

            init(string: String) {
                // add z w
                let patter = #"(inp|add|mul|div|mod|eql) ([wxyz])\s?([wxyz]|-?\d+)?"#
                let regex = try! NSRegularExpression(pattern: patter, options: [])

                let match = regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count))!
                let instruction = String(string[Range(match.range(at: 1), in: string)!])
                let a: Register = String(string[Range(match.range(at: 2), in: string)!]).first!
                let secondOperand = Range(match.range(at: 3), in: string).map({ string[$0] }).map(String.init)
                let b: Register? = secondOperand?.first
                let v: Int? = secondOperand.map({ Int($0) }) ?? nil

                switch instruction {
                    case "inp": self = .inp(a: a)
                    case "add":
                        if let v = v { self = .addv(a: a, v: v) }
                        else { self = .add(a: a, b: b!) }
                    case "mul":
                        if let v = v { self = .mulv(a: a, v: v) }
                        else { self = .mul(a: a, b: b!) }
                    case "div":
                        if let v = v { self = .divv(a: a, v: v) }
                        else { self = .div(a: a, b: b!) }
                    case "mod":
                        if let v = v { self = .modv(a: a, v: v) }
                        else { self = .mod(a: a, b: b!) }
                    case "eql":
                        if let v = v { self = .eqlv(a: a, v: v) }
                        else { self = .eql(a: a, b: b!) }
                    default: fatalError()
                }
            }
        }


        let input: [Int]

        private var registers: [Register: Int] = [
            "w": 0, "x": 0, "y": 0, "z": 0
        ]

        var state: String {
            "w: \(self["w"]), x: \(self["x"]), y: \(self["y"]), z: \(self["z"])"
        }

        private lazy var iterator = self.input.makeIterator()


        init(input: [Int]) {
            self.input = input
        }

        subscript(_ register: Register) -> Int {
            get { self.registers[register, default: 0] }
            set { self.registers[register] = newValue }
        }

        mutating func apply(_ instruction: Instruction) {
            switch instruction {
                case .inp(let a): self[a] = self.iterator.next()!
                case .add(let a, let b): self[a] = self[a] + self[b]
                case .addv(let a, let v): self[a] += v
                case .mul(let a, let b): self[a] = self[a] * self[b]
                case .mulv(let a, let v): self[a] *= v
                case .div(let a, let b): self[a] = self[a] / self[b]
                case .divv(let a, let v): self[a] /= v
                case .mod(let a, let b): self[a] = self[a] % self[b]
                case .modv(let a, let v): self[a] = self[a] % v
                case .eql(let a, let b): self[a] = (self[a] == self[b]) ? 1 : 0
                case .eqlv(let a, let v): self[a] = (self[a] == v) ? 1 : 0
            }
        }
        mutating func apply(_ instructions: [Instruction]) {
            instructions.forEach { self.apply($0) }
        }

    }


    @discardableResult static func runDay24(input: Input) async throws -> ChallengeResult {
        let instructions = input.lines().map(ALU.Instruction.init)

        var result = 0
        for modelNumber in (11111111111111...99999999999999).reversed() {
            let digits = String(modelNumber).compactMap { Int(String($0)) }
            if digits.contains(0) { continue }

            var alu = ALU(input: digits)
            alu.apply(instructions)
            if alu["z"] == 0 {
                result = modelNumber
                break
            }
        }

        print("Part 1: \(result) is the largest model number accepted by MONAD.")


        return (part1: "\(result)", part2: "")
    }

}
