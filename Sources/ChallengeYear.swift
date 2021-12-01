import ArgumentParser


/// Helper type for running specific daily challenges of the implementing year.
protocol ChallengeYear {

    static func runDay1(input: ChallengeInput) async throws
    static func runDay2(input: ChallengeInput) async throws
    static func runDay3(input: ChallengeInput) async throws
    static func runDay4(input: ChallengeInput) async throws
    static func runDay5(input: ChallengeInput) async throws
    static func runDay6(input: ChallengeInput) async throws
    static func runDay7(input: ChallengeInput) async throws
    static func runDay8(input: ChallengeInput) async throws
    static func runDay9(input: ChallengeInput) async throws
    static func runDay10(input: ChallengeInput) async throws
    static func runDay11(input: ChallengeInput) async throws
    static func runDay12(input: ChallengeInput) async throws
    static func runDay13(input: ChallengeInput) async throws
    static func runDay14(input: ChallengeInput) async throws
    static func runDay15(input: ChallengeInput) async throws
    static func runDay16(input: ChallengeInput) async throws
    static func runDay17(input: ChallengeInput) async throws
    static func runDay18(input: ChallengeInput) async throws
    static func runDay19(input: ChallengeInput) async throws
    static func runDay20(input: ChallengeInput) async throws
    static func runDay21(input: ChallengeInput) async throws
    static func runDay22(input: ChallengeInput) async throws
    static func runDay23(input: ChallengeInput) async throws
    static func runDay24(input: ChallengeInput) async throws
    static func runDay25(input: ChallengeInput) async throws

}


// Placeholder challenges for specific years.
// The actual implementation happens in extensions.
enum Challenges2015: ChallengeYear {}
enum Challenges2016: ChallengeYear {}
enum Challenges2017: ChallengeYear {}
enum Challenges2018: ChallengeYear {}
enum Challenges2019: ChallengeYear {}
enum Challenges2020: ChallengeYear {}
enum Challenges2021: ChallengeYear {}


// Some default implementations that are used when a challenge is not yet implemented.
extension ChallengeYear {

    static func runDay1(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay2(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay3(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay4(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay5(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay6(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay7(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay8(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay9(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay10(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay11(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay12(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay13(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay14(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay15(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay16(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay17(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay18(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay19(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay20(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay21(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay22(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay23(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay24(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay25(input: ChallengeInput) async throws { print("Not yet implemented."); throw ExitCode.failure }


    /// Convenient helper for running the corresponding challenge for the given day.
    static func run(day: UInt8, input: ChallengeInput) async throws {
        switch day {
            case 1: try await self.runDay1(input: input)
            case 2: try await self.runDay2(input: input)
            case 3: try await self.runDay3(input: input)
            case 4: try await self.runDay4(input: input)
            case 5: try await self.runDay5(input: input)
            case 6: try await self.runDay6(input: input)
            case 7: try await self.runDay7(input: input)
            case 8: try await self.runDay8(input: input)
            case 9: try await self.runDay9(input: input)
            case 10: try await self.runDay10(input: input)
            case 11: try await self.runDay11(input: input)
            case 12: try await self.runDay12(input: input)
            case 13: try await self.runDay13(input: input)
            case 14: try await self.runDay14(input: input)
            case 15: try await self.runDay15(input: input)
            case 16: try await self.runDay16(input: input)
            case 17: try await self.runDay17(input: input)
            case 18: try await self.runDay18(input: input)
            case 19: try await self.runDay19(input: input)
            case 20: try await self.runDay20(input: input)
            case 21: try await self.runDay21(input: input)
            case 22: try await self.runDay22(input: input)
            case 23: try await self.runDay23(input: input)
            case 24: try await self.runDay24(input: input)
            case 25: try await self.runDay25(input: input)
            default: throw ValidationError("Invalid day")
        }
    }

}
