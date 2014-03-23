{-

https://projecteuler.net/problem=14

	The following iterative sequence is defined for the set of positive integers:

	n -> n/2 (n is even)
	n -> 3n + 1 (n is odd)

	Using the rule above and starting with 13, we generate the following sequence:

	13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
	It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

	Which starting number, under one million, produces the longest chain?

	NOTE: Once the chain starts the terms are allowed to go above one million.

-}

iterator :: Integer -> Integer
iterator n
	| mod n 2 == 0	= (quot n 2)
	| otherwise		= 3 * n + 1

collatz :: [Integer] -> [Integer]
collatz x
	| last x == 1	= x
	| otherwise		= collatz (x ++ [ iterator(last x) ])

-- lengths n = [ length(collatz([k])) | k <- [ 1 .. n ] ]

-- answer n = maximum (zip (lengths n) [ 1 .. n ])


{-

theoretically the above works, but it didn't give an answer after 10 minutes.
back to the drawing board?

-}


{-

-- http://www.haskell.org/haskellwiki/Memoization

memoized_fib :: Int -> Integer
memoized_fib = ((map fib [0 ..]) !!)
	where fib 0 = 0
			fib 1 = 1
			fib n = memoized_fib (n-2) + memoized_fib (n-1)

-}

collatz2 :: [Integer] -> [Integer]
collatz2 x
	| last x < head x	= x
	| otherwise			= collatz2 (x ++ [ iterator(last x) ])

memoized_collatz_length = (map collatz_length [1 ..])
	where
		collatz_length :: Int -> Int
		collatz_length 1 = 1
		collatz_length k = length(collatz2([toInteger(k)])) - 1 + (memoized_collatz_length !! fromInteger(last(collatz2([toInteger(k)])) - 1))

lengths n = zip (take n memoized_collatz_length) [ 1 .. n ]
answer n = maximum (lengths n)

{-

*Main> answer 1000000
(525,837799)

this took about 40 minutes. jeez.
-}
