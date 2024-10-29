import qualified Data.List
import Data.Maybe (fromJust)

rock = 1
paper = 2
scissors = 3
rps_val :: [(Char, Int)]
rps_val = [('A', rock), ('X', rock), ('B', paper),('Y', paper), ('C', scissors), ('Z', scissors)]

part1DecideWinner :: Int -> Int -> Int
part1DecideWinner opp us 
    | opp == us = 3
    | opp == rock && us == paper 
        || opp == paper && us == scissors 
        || opp == scissors && us == rock = 6
    | otherwise = 0

part1SolveRound line =
    if length line /= 0 then
        us + part1DecideWinner opp us
    else
        0
    where
    cols = map (head) $ words line -- The columns are space separated. Each consists of a single character.
    opp = fromJust $ lookup (head cols) rps_val
    us = fromJust $ lookup (last cols) rps_val

solvePart1 input = foldl (+) 0 $ map part1SolveRound $ lines input

main = do
    test_input <- readFile "test-input.txt"
    part1_input <- readFile "part1-input.txt"

    print $ solvePart1 test_input
    print $ solvePart1 part1_input
    
