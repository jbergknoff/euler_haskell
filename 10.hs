{-

https://projecteuler.net/problem=10

	The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

	Find the sum of all the primes below two million.

-}

-- I tried the naive listing of primes as in problem 3, but it was way too slow.
-- Instead, try a sieve?

--import Data.List
--sieve (x:xs)
--	| length xs == 0	= [ x ]
--	| otherwise			= x : sieve (xs \\ [ 2*x, 3*x .. (last xs) ])

primes_below n = sieve [ 2 .. (n-1) ] where
	sieve (x:xs)
		| length xs == 0	= [ x ]
		-- great suggestion from http://www.haskell.org/haskellwiki/Prime_numbers
		| x * x >= n		= x : xs
		| otherwise			= x : sieve (filter (\y -> (mod y x) /= 0) xs)

answer n = foldr (+) 0 (primes_below n)

{-

sieve [2,3,4,5,6]
= 2 : sieve ([3,4,5,6] \\ [4, 6]) = 2 : sieve ([3,5])
= 2 : 3 : sieve([5] \\ []) = 2 : 3 : sieve([5])
= 2 : 3 : 5

-}

{-

the sieve is extremely slow, both with Data.List list difference (\\) and
with filtering. It speeds up as it goes along, as expected (smaller list to
sieve on each subsequence step), but still very slow.

how does Mathematica do it so fast?

	Total[Select[Table[Prime[k], {k, 5*10^5}], # < 2*10^6 &]]
	142913828922

takes no time at all

-}
