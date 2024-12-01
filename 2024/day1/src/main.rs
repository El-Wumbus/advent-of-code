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
        .unzip();
    left.sort();
    right.sort();

    left.into_iter()
        .zip(right.into_iter())
        .map(|(l, r)| (l.parse::<i32>().unwrap(), r.parse::<i32>().unwrap()))
        .fold(0, |acc, (l, r)| acc + i32::abs(l - r))
}

fn main() {
    println!("PART 1: {}", part1());
}
