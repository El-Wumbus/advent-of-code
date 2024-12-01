#![feature(iter_array_chunks)]
const INPUT: &str = include_str!("../input.txt");

fn part1() -> u32 {
    const RGB_MAX: [u32; 3] = [12, 13, 14];

    INPUT
        .lines()
        .filter(|x| !x.is_empty())
        .filter_map(|line| {
            let (game_id, rest) = line.split_once(':').unwrap();
            let id = game_id
                .strip_prefix("Game ")
                .and_then(|id| id.parse::<u32>().ok())
                .unwrap();
            let mut inv = false;

            rest.split([',', ';'])
                .flat_map(|x| x.split_whitespace())
                .array_chunks::<2>()
                .for_each(|[num, color]| {
                    let rgb_idx = match color {
                        "red" => 0,
                        "green" => 1,
                        "blue" => 2,
                        _ => unreachable!(),
                    };
                    let max = RGB_MAX[rgb_idx];
                    let num = num.parse::<u32>().unwrap();
                    if num > max {
                        inv = true;
                    }
                });

            if !inv { Some(id) } else { None }
        })
        .sum()
}

fn main() {
    let part1 = part1();

    println!("Part 1: {part1}");

    assert_eq!(part1, 3099);
}
