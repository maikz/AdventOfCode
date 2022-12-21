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

    func testDay16() async throws {
        let input1 = TestInput(string: "D2FE28")
        let result1 = try await Challenges2021.runDay16(input: input1)
        XCTAssertEqual(result1.part1, "6")

        let input2 = TestInput(string: "38006F45291200")
        let result2 = try await Challenges2021.runDay16(input: input2)
        XCTAssertEqual(result2.part1, "9")

        let input3 = TestInput(string: "EE00D40C823060")
        let result3 = try await Challenges2021.runDay16(input: input3)
        XCTAssertEqual(result3.part1, "14")

        let input4 = TestInput(string: "8A004A801A8002F478")
        let result4 = try await Challenges2021.runDay16(input: input4)
        XCTAssertEqual(result4.part1, "16")

        let input5 = TestInput(string: "620080001611562C8802118E34")
        let result5 = try await Challenges2021.runDay16(input: input5)
        XCTAssertEqual(result5.part1, "12")

        let input6 = TestInput(string: "C0015000016115A2E0802F182340")
        let result6 = try await Challenges2021.runDay16(input: input6)
        XCTAssertEqual(result6.part1, "23")

        let input7 = TestInput(string: "A0016C880162017C3686B18A3D4780")
        let result7 = try await Challenges2021.runDay16(input: input7)
        XCTAssertEqual(result7.part1, "31")

        let input8 = TestInput(string: "C200B40A82")
        let result8 = try await Challenges2021.runDay16(input: input8)
        XCTAssertEqual(result8.part2, "3")

        let input9 = TestInput(string: "04005AC33890")
        let result9 = try await Challenges2021.runDay16(input: input9)
        XCTAssertEqual(result9.part2, "54")

        let input10 = TestInput(string: "880086C3E88112")
        let result10 = try await Challenges2021.runDay16(input: input10)
        XCTAssertEqual(result10.part2, "7")

        let input11 = TestInput(string: "CE00C43D881120")
        let result11 = try await Challenges2021.runDay16(input: input11)
        XCTAssertEqual(result11.part2, "9")

        let input12 = TestInput(string: "D8005AC2A8F0")
        let result12 = try await Challenges2021.runDay16(input: input12)
        XCTAssertEqual(result12.part2, "1")

        let input13 = TestInput(string: "F600BC2D8F")
        let result13 = try await Challenges2021.runDay16(input: input13)
        XCTAssertEqual(result13.part2, "0")

        let input14 = TestInput(string: "9C005AC2F8F0")
        let result14 = try await Challenges2021.runDay16(input: input14)
        XCTAssertEqual(result14.part2, "0")

        let input15 = TestInput(string: "9C0141080250320F1802104A08")
        let result15 = try await Challenges2021.runDay16(input: input15)
        XCTAssertEqual(result15.part2, "1")
    }

    func testDay17() async throws {
        let input = TestInput(string: "target area: x=20..30, y=-10..-5")
        let result = try await Challenges2021.runDay17(input: input)
        XCTAssertEqual(result.part1, "45")
        XCTAssertEqual(result.part2, "112")
    }

    func testDay18() async throws {
        let input = TestInput(string: """
            [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
            [[[5,[2,8]],4],[5,[[9,9],0]]]
            [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
            [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
            [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
            [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
            [[[[5,4],[7,7]],8],[[8,3],8]]
            [[9,3],[[9,9],[6,[4,9]]]]
            [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
            [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
            """)
        let result = try await Challenges2021.runDay18(input: input)
        XCTAssertEqual(result.part1, "4140")
        XCTAssertEqual(result.part2, "???")
    }

    func testDay19() async throws {
        let input = TestInput(string: """
            --- scanner 0 ---
            404,-588,-901
            528,-643,409
            -838,591,734
            390,-675,-793
            -537,-823,-458
            -485,-357,347
            -345,-311,381
            -661,-816,-575
            -876,649,763
            -618,-824,-621
            553,345,-567
            474,580,667
            -447,-329,318
            -584,868,-557
            544,-627,-890
            564,392,-477
            455,729,728
            -892,524,684
            -689,845,-530
            423,-701,434
            7,-33,-71
            630,319,-379
            443,580,662
            -789,900,-551
            459,-707,401

            --- scanner 1 ---
            686,422,578
            605,423,415
            515,917,-361
            -336,658,858
            95,138,22
            -476,619,847
            -340,-569,-846
            567,-361,727
            -460,603,-452
            669,-402,600
            729,430,532
            -500,-761,534
            -322,571,750
            -466,-666,-811
            -429,-592,574
            -355,545,-477
            703,-491,-529
            -328,-685,520
            413,935,-424
            -391,539,-444
            586,-435,557
            -364,-763,-893
            807,-499,-711
            755,-354,-619
            553,889,-390

            --- scanner 2 ---
            649,640,665
            682,-795,504
            -784,533,-524
            -644,584,-595
            -588,-843,648
            -30,6,44
            -674,560,763
            500,723,-460
            609,671,-379
            -555,-800,653
            -675,-892,-343
            697,-426,-610
            578,704,681
            493,664,-388
            -671,-858,530
            -667,343,800
            571,-461,-707
            -138,-166,112
            -889,563,-600
            646,-828,498
            640,759,510
            -630,509,768
            -681,-892,-333
            673,-379,-804
            -742,-814,-386
            577,-820,562

            --- scanner 3 ---
            -589,542,597
            605,-692,669
            -500,565,-823
            -660,373,557
            -458,-679,-417
            -488,449,543
            -626,468,-788
            338,-750,-386
            528,-832,-391
            562,-778,733
            -938,-730,414
            543,643,-506
            -524,371,-870
            407,773,750
            -104,29,83
            378,-903,-323
            -778,-728,485
            426,699,580
            -438,-605,-362
            -469,-447,-387
            509,732,623
            647,635,-688
            -868,-804,481
            614,-800,639
            595,780,-596

            --- scanner 4 ---
            727,592,562
            -293,-554,779
            441,611,-461
            -714,465,-776
            -743,427,-804
            -660,-479,-426
            832,-632,460
            927,-485,-438
            408,393,-506
            466,436,-512
            110,16,151
            -258,-428,682
            -393,719,612
            -211,-452,876
            808,-476,-593
            -575,615,604
            -485,667,467
            -680,325,-822
            -627,-443,-432
            872,-547,-609
            833,512,582
            807,604,487
            839,-516,451
            891,-625,532
            -652,-548,-490
            30,-46,-14
            """)
        let result = try await Challenges2021.runDay19(input: input)
        XCTAssertEqual(result.part1, "79")
        XCTAssertEqual(result.part2, "???")
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

    func testDay22() async throws {
        let input1 = TestInput(string: """
            on x=10..12,y=10..12,z=10..12
            on x=11..13,y=11..13,z=11..13
            off x=9..11,y=9..11,z=9..11
            on x=10..10,y=10..10,z=10..10
            """)
        let result1 = try await Challenges2021.runDay22(input: input1)
        XCTAssertEqual(result1.part1, "39")
        XCTAssertEqual(result1.part2, "39")

        let input2 = TestInput(string: """
            on x=-20..26,y=-36..17,z=-47..7
            on x=-20..33,y=-21..23,z=-26..28
            on x=-22..28,y=-29..23,z=-38..16
            on x=-46..7,y=-6..46,z=-50..-1
            on x=-49..1,y=-3..46,z=-24..28
            on x=2..47,y=-22..22,z=-23..27
            on x=-27..23,y=-28..26,z=-21..29
            on x=-39..5,y=-6..47,z=-3..44
            on x=-30..21,y=-8..43,z=-13..34
            on x=-22..26,y=-27..20,z=-29..19
            off x=-48..-32,y=26..41,z=-47..-37
            on x=-12..35,y=6..50,z=-50..-2
            off x=-48..-32,y=-32..-16,z=-15..-5
            on x=-18..26,y=-33..15,z=-7..46
            off x=-40..-22,y=-38..-28,z=23..41
            on x=-16..35,y=-41..10,z=-47..6
            off x=-32..-23,y=11..30,z=-14..3
            on x=-49..-5,y=-3..45,z=-29..18
            off x=18..30,y=-20..-8,z=-3..13
            on x=-41..9,y=-7..43,z=-33..15
            on x=-54112..-39298,y=-85059..-49293,z=-27449..7877
            on x=967..23432,y=45373..81175,z=27513..53682
            """)
//        let result2 = try await Challenges2021.runDay22(input: input2)
//        XCTAssertEqual(result2.part1, "590784")
//        XCTAssertEqual(result1.part2, "2758514936282235")
        XCTFail("Running out of memory with the current implementation...")
    }

    func testDay23() async throws {
        let input = TestInput(string: """
            #############
            #...........#
            ###B#C#B#D###
              #A#D#C#A#
              #########
            """)
        let result = try await Challenges2021.runDay23(input: input)
        XCTAssertEqual(result.part1, "12521")
        XCTAssertEqual(result.part2, "???")
    }

    func testDay24() async throws {
        let input = TestInput(string: """
            inp z
            inp x
            mul z 3
            eql z x
            """)
        let result = try await Challenges2021.runDay24(input: input)
        XCTAssertEqual(result.part1, "39999999999999")
        XCTAssertEqual(result.part2, "???")
    }

    func testDay25() async throws {
        let input = TestInput(string: """
            v...>>.vv>
            .vv>>.vv..
            >>.>v>...v
            >>v>>.>.v.
            v>v.vv.v..
            >.>>..v...
            .vv..>.>v.
            v.v..>>v.v
            ....v..v.>
            """)
        let result = try await Challenges2021.runDay25(input: input)
        XCTAssertEqual(result.part1, "58")
        XCTAssertEqual(result.part2, "???")
    }

}
