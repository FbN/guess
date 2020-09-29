module Main where

import qualified MyLib (someFunc)

-- word to guess
-- single letter per turn
-- good letter -> show in work
-- bad letter -> loose a star
-- no star = loose
-- all chars = win

check :: String -> String -> Char -> (Bool, String)
check word display c = 
  ( 
    elem c word,
    [(if x==c then c else y)| (x, y) <- zip word display]
  )

mkguess :: String -> String -> Int -> IO()
mkguess word display n =
  do putStrLn (display ++ " " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

turn :: String -> String -> Int -> IO()
turn word display n 
  | n==0 = putStrLn "looose"
  | word==display = putStrLn "winn"
  | otherwise = mkguess word display n

game :: String -> Int -> IO()
game word n = turn word ['-' | x <-word] n

main :: IO ()
main = game "Ciao" 6
