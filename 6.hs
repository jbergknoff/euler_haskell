{-

https://projecteuler.net/problem=6

	The sum of the squares of the first ten natural numbers is,

	12 + 22 + ... + 102 = 385
	The square of the sum of the first ten natural numbers is,

	(1 + 2 + ... + 10)2 = 552 = 3025
	Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

	Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

-}

-- no sense in brute forcing this when there is an easily computed closed form answer
-- the wording of the problem seems to be slightly off; we want the negative of what's asked,
-- i.e. (sum k)^2 - sum (k^2) = 1/12 (3n^4 + 2n^3 - 3n^2 - 2n)

answer :: Int -> Int
answer n = div (3 * n * n * n * n + 2 * n * n * n - 3 * n * n - 2 * n) 12

{-

*Main> answer 100
25164150

-}
