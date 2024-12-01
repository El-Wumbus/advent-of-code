import Data.Char (isLowerCase, ord)
import Data.List (isInfixOf, nub)

-- Simply splits a string in half
getComp :: String -> (String, String)
getComp line =
    (take cl line, drop cl line)
    where cl = (length line) `div` 2

characterPriority :: Char -> Int
characterPriority ch = 
    if isLowerCase ch then (ord ch) - 97 + 1
    else ord ch - 65 + 27

-- Find the repeating items within the compartment
compSelectRepeating :: (String, String) -> String
compSelectRepeating (left, right) = nub $ filter (\x -> x `elem` right) left 

compPriority :: String -> [Int]
compPriority compartment = map characterPriority compartment

solvePart1 input =  foldl (+) 0 $ concat $ map compPriority $ map compSelectRepeating $ map getComp $ lines input

main = do
    test_input <- readFile "test-input.txt"
    part1_input <- readFile "part1-input.txt"
--    part2_input <- readFile "part2-input.txt"
    putStrLn $ "Part 1 test: " ++ (show $ solvePart1 test_input)
    putStrLn $ "Part 1: " ++ (show $ solvePart1 part1_input)
--    putStrLn $ "Part 2 test: " ++ (show $ solvePart2 test_input)
--    putStrLn $ "Part 2: " ++ (show $ solvePart2 1part2_input)
