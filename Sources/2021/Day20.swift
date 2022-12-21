extension Challenges2021 {

    private typealias Image = Grid<Character>

    private static let valueMapping: [Character: Character] = [
        ".": "0",
        "#": "1",
    ]

    private static func applyConvolution(to image: Image, with map: [Character]) -> Image {
        let newImage = image.applyingConvolution { area in
            let valueString = String(area.map(\.value).map({ valueMapping[$0]! }))
            let value = Int(valueString, radix: 2)!
            return map[value]
        }
        // make sure to switch between "black" and "white" in the padded area if the
        // mapping demands it (using the mapping value for "black" or for "white")
        let newPaddingIndex = newImage.padding == "." ? 0 : 511
        let newPadding = map[newPaddingIndex]
        return newImage.withPadding(newPadding)
    }

    @discardableResult static func runDay20(input: Input) async throws -> ChallengeResult {
        let lines = input.lines()
        let map = Array(lines.first!)
        let pixels = lines.dropFirst().map({ Array($0) })
        let image = Image(pixels, padding: ".")


        // Part 1

        var newImage = image
        for _ in 1...2 {
            newImage = self.applyConvolution(to: newImage, with: map)
        }
        let count1 = newImage.allValues.filter({ $0 == "#" }).count

        print("Part 1: \(count1) pixels are lit in the resulting image.")


        // Part 2

        for _ in 3...50 {
            newImage = self.applyConvolution(to: newImage, with: map)
        }
        let count2 = newImage.allValues.filter({ $0 == "#" }).count

        print("Part 2: \(count2) pixels are lit in the resulting image.")


        return (part1: "\(count1)", part2: "\(count2)")
    }

}
