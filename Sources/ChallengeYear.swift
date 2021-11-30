import ArgumentParser


/// Helper type for running specific daily challenges of the implementing year.
protocol ChallengeYear {

    static func runDay1() throws
    static func runDay2() throws
    static func runDay3() throws
    static func runDay4() throws
    static func runDay5() throws
    static func runDay6() throws
    static func runDay7() throws
    static func runDay8() throws
    static func runDay9() throws
    static func runDay10() throws
    static func runDay11() throws
    static func runDay12() throws
    static func runDay13() throws
    static func runDay14() throws
    static func runDay15() throws
    static func runDay16() throws
    static func runDay17() throws
    static func runDay18() throws
    static func runDay19() throws
    static func runDay20() throws
    static func runDay21() throws
    static func runDay22() throws
    static func runDay23() throws
    static func runDay24() throws
    static func runDay25() throws

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

    static func runDay1() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay2() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay3() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay4() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay5() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay6() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay7() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay8() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay9() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay10() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay11() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay12() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay13() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay14() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay15() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay16() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay17() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay18() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay19() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay20() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay21() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay22() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay23() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay24() throws { print("Not yet implemented."); throw ExitCode.failure }
    static func runDay25() throws { print("Not yet implemented."); throw ExitCode.failure }


    /// Convenient helper for running the corresponding challenge for the given day.
    static func run(day: UInt8) throws {
        switch day {
            case 1: try self.runDay1()
            case 2: try self.runDay2()
            case 3: try self.runDay3()
            case 4: try self.runDay4()
            case 5: try self.runDay5()
            case 6: try self.runDay6()
            case 7: try self.runDay7()
            case 8: try self.runDay8()
            case 9: try self.runDay9()
            case 10: try self.runDay10()
            case 11: try self.runDay11()
            case 12: try self.runDay12()
            case 13: try self.runDay13()
            case 14: try self.runDay14()
            case 15: try self.runDay15()
            case 16: try self.runDay16()
            case 17: try self.runDay17()
            case 18: try self.runDay18()
            case 19: try self.runDay19()
            case 20: try self.runDay20()
            case 21: try self.runDay21()
            case 22: try self.runDay22()
            case 23: try self.runDay23()
            case 24: try self.runDay24()
            case 25: try self.runDay25()
            default: throw ValidationError("Invalid day")
        }
    }

}
