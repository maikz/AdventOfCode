import ArgumentParser
import Foundation


@main
struct AdventOfCode: ParsableCommand {

    @Option(name: .shortAndLong, help: "The challenge year. Uses the current year by default.")
    var year: UInt = Date().currentYearInEST

    @Option(name: .shortAndLong, help: "The challenge day. Uses the current day by default")
    var day: UInt8 = Date().currentDayInEST


    mutating func run() throws {
        print("Running day \(self.day) of year \(self.year)...")
        print("")

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


extension Date {

    var currentDayInEST: UInt8 {
        let day = self.string(for: "d", timeZone: "EST")
        return UInt8(day)!
    }

    var currentYearInEST: UInt {
        let year = self.string(for: "yyyy", timeZone: "EST")
        return UInt(year)!
    }

    private func string(for format: String, timeZone: String) -> String {
        let dateFormatter = DateFormatter()
        // use the time zone where new challenges go live at midnight
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
