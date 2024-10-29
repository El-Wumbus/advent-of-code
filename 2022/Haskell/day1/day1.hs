import Data.List (isPrefixOf)
import qualified Data.List

-- Split a string at a substring
splitStr :: Eq a => [a] -> [a] -> [[a]]
splitStr sub str = split' sub str [] []
    where
    split' _   []  subacc acc = reverse (reverse subacc:acc)
    split' sub str subacc acc
        | sub `isPrefixOf` str = split' sub (drop (length sub) str) [] (reverse subacc:acc)
        | otherwise            = split' sub (tail str) (head str:subacc) acc



solveGroups input = 
    reverse $ Data.List.sort $ map (foldl (+) 0) groups
    where
    groups = map (map read) $ map words $ splitStr "\n\n" input

solvePart1 input = head $ solveGroups input

solvePart2 input = foldl (+) 0 $ take 3 $ solveGroups input
    

main = do
    test_input  <- readFile "test-input.txt"
    part1_input <- readFile "part1-puzzle-input.txt"
    part2_input <- readFile "part2-puzzle-input.txt"
  
    print (solvePart1 test_input)
    print (solvePart1 part1_input)
   
    print (solvePart2 test_input)
    print (solvePart2 part2_input)
    
    
