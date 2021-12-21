@testable import AdventOfCode
import XCTest


final class AdventOfCode2021Tests: XCTestCase {

    func testDay1() async throws {
        let input = TestInput(string: """
            199
            200
            208
            210
            200
            207
            240
            269
            260
            263
            """)
        let result = try await Challenges2021.runDay1(input: input)
        XCTAssertEqual(result.part1, "7")
        XCTAssertEqual(result.part2, "5")
    }

    func testDay2() async throws {
        let input = TestInput(string: """
            forward 5
            down 5
            forward 8
            up 3
            down 8
            forward 2
            """)
        let result = try await Challenges2021.runDay2(input: input)
        XCTAssertEqual(result.part1, "150")
        XCTAssertEqual(result.part2, "900")
    }

    func testDay3() async throws {
        let input = TestInput(string: """
            00100
            11110
            10110
            10111
            10101
            01111
            00111
            11100
            10000
            11001
            00010
            01010
            """)
        let result = try await Challenges2021.runDay3(input: input)
        XCTAssertEqual(result.part1, "198")
        XCTAssertEqual(result.part2, "230")
    }

    func testDay4() async throws {
        let input = TestInput(string: """
            7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

            22 13 17 11  0
             8  2 23  4 24
            21  9 14 16  7
             6 10  3 18  5
             1 12 20 15 19

             3 15  0  2 22
             9 18 13 17  5
            19  8  7 25 23
            20 11 10 24  4
            14 21 16 12  6

            14 21 17 24  4
            10 16 15  9 19
            18  8 23 26 20
            22 11 13  6  5
             2  0 12  3  7
            """)
        let result = try await Challenges2021.runDay4(input: input)
        XCTAssertEqual(result.part1, "4512")
        XCTAssertEqual(result.part2, "1924")
    }

    func testDay5() async throws {
        let input = TestInput(string: """
            0,9 -> 5,9
            8,0 -> 0,8
            9,4 -> 3,4
            2,2 -> 2,1
            7,0 -> 7,4
            6,4 -> 2,0
            0,9 -> 2,9
            3,4 -> 1,4
            0,0 -> 8,8
            5,5 -> 8,2
            """)
        let result = try await Challenges2021.runDay5(input: input)
        XCTAssertEqual(result.part1, "5")
        XCTAssertEqual(result.part2, "12")
    }

    func testDay6() async throws {
        let input = TestInput(string: "3,4,3,1,2")
        let result = try await Challenges2021.runDay6(input: input)
        XCTAssertEqual(result.part1, "5934")
        XCTAssertEqual(result.part2, "26984457539")
    }

    func testDay7() async throws {
        let input = TestInput(string: "16,1,2,0,4,2,7,1,2,14")
        let result = try await Challenges2021.runDay7(input: input)
        XCTAssertEqual(result.part1, "37")
        XCTAssertEqual(result.part2, "168")
    }

    func testDay8() async throws {
        let input = TestInput(string: """
            be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
            edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
            fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
            fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
            aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
            fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
            dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
            bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
            egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
            gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
            """)
        let result = try await Challenges2021.runDay8(input: input)
        XCTAssertEqual(result.part1, "26")
        XCTAssertEqual(result.part2, "61229")
    }

    func testDay9() async throws {
        let input = TestInput(string: """
            2199943210
            3987894921
            9856789892
            8767896789
            9899965678
            """)
        let result = try await Challenges2021.runDay9(input: input)
        XCTAssertEqual(result.part1, "15")
        XCTAssertEqual(result.part2, "1134")
    }

    func testDay10() async throws {
        let input = TestInput(string: """
            [({(<(())[]>[[{[]{<()<>>
            [(()[<>])]({[<{<<[]>>(
            {([(<{}[<>[]}>{[]{[(<()>
            (((({<>}<{<{<>}{[]{[]{}
            [[<[([]))<([[{}[[()]]]
            [{[{({}]{}}([{[{{{}}([]
            {<[[]]>}<{[{[{[]{()[[[]
            [<(<(<(<{}))><([]([]()
            <{([([[(<>()){}]>(<<{{
            <{([{{}}[<[[[<>{}]]]>[]]
            """)
        let result = try await Challenges2021.runDay10(input: input)
        XCTAssertEqual(result.part1, "26397")
        XCTAssertEqual(result.part2, "288957")
    }

    func testDay11() async throws {
        let input = TestInput(string: """
            5483143223
            2745854711
            5264556173
            6141336146
            6357385478
            4167524645
            2176841721
            6882881134
            4846848554
            5283751526
            """)
        let result = try await Challenges2021.runDay11(input: input)
        XCTAssertEqual(result.part1, "1656")
        XCTAssertEqual(result.part2, "195")
    }

    func testDay12() async throws {
        let input1 = TestInput(string: """
            start-A
            start-b
            A-c
            A-b
            b-d
            A-end
            b-end
            """)
        let result1 = try await Challenges2021.runDay12(input: input1)
        XCTAssertEqual(result1.part1, "10")
        XCTAssertEqual(result1.part2, "36")

        let input2 = TestInput(string: """
            dc-end
            HN-start
            start-kj
            dc-start
            dc-HN
            LN-dc
            HN-end
            kj-sa
            kj-HN
            kj-dc
            """)
        let result2 = try await Challenges2021.runDay12(input: input2)
        XCTAssertEqual(result2.part1, "19")
        XCTAssertEqual(result2.part2, "103")

        let input3 = TestInput(string: """
            fs-end
            he-DX
            fs-he
            start-DX
            pj-DX
            end-zg
            zg-sl
            zg-pj
            pj-he
            RW-he
            fs-DX
            pj-RW
            zg-RW
            start-pj
            he-WI
            zg-he
            pj-fs
            start-RW
            """)
        let result3 = try await Challenges2021.runDay12(input: input3)
        XCTAssertEqual(result3.part1, "226")
        XCTAssertEqual(result3.part2, "3509")
    }

    func testDay13() async throws {
        let input = TestInput(string: """
            6,10
            0,14
            9,10
            0,3
            10,4
            4,11
            6,0
            6,12
            4,1
            0,13
            10,12
            3,4
            3,0
            8,4
            1,10
            2,14
            8,10
            9,0

            fold along y=7
            fold along x=5
            """)
        let result = try await Challenges2021.runDay13(input: input)
        XCTAssertEqual(result.part1, "17")
        let pattern = """
            #####
            #...#
            #...#
            #...#
            #####
            """
        XCTAssertEqual(result.part2, pattern)
    }

    func testDay14() async throws {
        let input = TestInput(string: """
            NNCB

            CH -> B
            HH -> N
            CB -> H
            NH -> C
            HB -> C
            HC -> B
            HN -> C
            NN -> C
            BH -> H
            NC -> B
            NB -> B
            BN -> B
            BB -> N
            BC -> B
            CC -> N
            CN -> C
            """)
        let result = try await Challenges2021.runDay14(input: input)
        XCTAssertEqual(result.part1, "1588")
        XCTAssertEqual(result.part2, "2188189693529")
    }

    func testDay15() async throws {
        let input = TestInput(string: """
            1163751742
            1381373672
            2136511328
            3694931569
            7463417111
            1319128137
            1359912421
            3125421639
            1293138521
            2311944581
            """)
        let result = try await Challenges2021.runDay15(input: input)
        XCTAssertEqual(result.part1, "40")
        XCTAssertEqual(result.part2, "315")
    }

    func testDay17() async throws {
        let input = TestInput(string: "target area: x=20..30, y=-10..-5")
        let result = try await Challenges2021.runDay17(input: input)
        XCTAssertEqual(result.part1, "45")
        XCTAssertEqual(result.part2, "112")
    }

    func testDay20() async throws {
        let input = TestInput(string: """
            ..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#

            #..#.
            #....
            ##..#
            ..#..
            ..###
            """)
        let result = try await Challenges2021.runDay20(input: input)
        XCTAssertEqual(result.part1, "35")
        XCTAssertEqual(result.part2, "3351")
    }

    func testDay21() async throws {
        let input = TestInput(string: """
            Player 1 starting position: 4
            Player 2 starting position: 8
            """)
        let result = try await Challenges2021.runDay21(input: input)
        XCTAssertEqual(result.part1, "739785")
        XCTAssertEqual(result.part2, "444356092776315")
    }

}
