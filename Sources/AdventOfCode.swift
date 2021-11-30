import ArgumentParser


@main
struct AdventOfCode: ParsableCommand {

    @Option(name: .shortAndLong, help: "The challenge year.")
    var year: UInt = 2021

    @Option(name: .shortAndLong, help: "The challenge day.")
    var day: UInt8 = 1


    mutating func run() throws {
        switch self.year {
            case 2015: try Challenges2015.run(day: self.day)
            case 2016: try Challenges2016.run(day: self.day)
            case 2017: try Challenges2017.run(day: self.day)
            case 2018: try Challenges2018.run(day: self.day)
            case 2019: try Challenges2019.run(day: self.day)
            case 2020: try Challenges2020.run(day: self.day)
            case 2021: try Challenges2021.run(day: self.day)
            default: throw ValidationError("No challenges available for this year.")
        }
    }

}
