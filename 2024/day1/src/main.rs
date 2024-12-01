const INPUT: &str = include_str!("../input.txt");

fn part1() -> i32 {
    let (mut left, mut right): (Vec<_>, Vec<_>) = INPUT
        .lines()
        .filter(|x| !x.is_empty())
        .map(|line| {
            // I split them like this because I'm not sure of what kind of
            // whitespace they're separated by.
            let mut pairs = line.split_whitespace();
            (pairs.next().unwrap(), pairs.next().unwrap())
        })
        .map(|(l, r)| (l.parse::<i32>().unwrap(), r.parse::<i32>().unwrap()))
        .unzip();
    left.sort();
    right.sort();

    left.into_iter()
        .zip(right.into_iter())
        .fold(0, |acc, (l, r)| acc + i32::abs(l - r))
}

fn part2() -> i32 {
    let (left, right): (Vec<_>, Vec<_>) = INPUT
        .lines()
        .filter(|x| !x.is_empty())
        .map(|line| {
            // I split them like this because I'm not sure of what kind of
            // whitespace they're separated by.
            let mut pairs = line.split_whitespace();
            (pairs.next().unwrap(), pairs.next().unwrap())
        })
        .map(|(l, r)| (l.parse::<i32>().unwrap(), r.parse::<i32>().unwrap()))
        .unzip();

    let right = right.iter();
    left.into_iter()
        .map(|n| n * right.clone().filter(|r| **r == n).count() as i32)
        .sum()
}

fn main() {
    let part1 = part1();
    let part2 = part2();
    println!("PART 1: {part1}");
    println!("PART 2: {part2} ");
    assert_eq!(part2, 26800609);
    assert_eq!(part1, 1530215);
}
