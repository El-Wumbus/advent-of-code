import qualified Data.List
import Data.Maybe (fromJust)

rock = 1
paper = 2
scissors = 3
rps_val :: [(Char, Int)]
rps_val = [('A', rock), ('X', rock), ('B', paper),('Y', paper), ('C', scissors), ('Z', scissors)]

-- The columns are space separated. Each consists of a single character.
parseCols :: String -> (Char, Char)
parseCols line = let cols = map (head) $ words line in (head cols, last cols)

part1DecideWinner :: Int -> Int -> Int
part1DecideWinner opp us 
    | opp == us = 3
    | opp == rock && us == paper 
        || opp == paper && us == scissors 
        || opp == scissors && us == rock = 6
    | otherwise = 0


part1SolveRound line =
    if length line /= 0 then us + part1DecideWinner opp us
    else 0
    where
    (o, u) = parseCols line
    opp = fromJust $ lookup o rps_val
    us = fromJust $ lookup u rps_val

part2DecideWinner (opp, outcome) =
    roundScore + us
    where
    opponent = fromJust $ lookup opp rps_val
    (roundScore, us) = case outcome of
        'Y' -> (3, opponent)
        'X' -> (0,
            if opponent == rock then scissors
            else if opponent == scissors then paper
            else rock)
        'Z' -> (6,
            if opponent == rock then paper
            else if opponent == scissors then rock
            else scissors)

part2SolveRound line =
    if length line /= 0 then part2DecideWinner $ parseCols line
    else 0

solvePart1 input = foldl (+) 0 $ map part1SolveRound $ lines input
solvePart2 input = foldl (+) 0 $ map part2SolveRound $ lines input

main = do
    test_input <- readFile "test-input.txt"
    part1_input <- readFile "part1-input.txt"
    part2_input <- readFile "part2-input.txt"
    putStrLn $ "Part 1 test: " ++ (show $ solvePart1 test_input)
    putStrLn $ "Part 1: " ++ (show $ solvePart1 part1_input)
    putStrLn $ "Part 2 test: " ++ (show $ solvePart2 test_input)
    putStrLn $ "Part 2: " ++ (show $ solvePart2 part2_input)
