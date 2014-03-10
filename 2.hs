fib n = if n < 3 then 1 else fib (n-1) + fib (n-2)
fibs = map fib [1..]

small_fibs max = takeWhile (\f -> f < max) fibs
answer max = sum [ f | f <- small_fibs max, mod f 2 == 0 ]

{-|
*Main> answer 4000000
4613732

but this is extremely slow.
-}
