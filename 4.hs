{-

https://projecteuler.net/problem=4

	A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

	Find the largest palindrome made from the product of two 3-digit numbers.

-}

digits n
	| n < 10		= [ n ]
	| otherwise		= (mod n 10) : digits (div n 10)

is_palindrome n = (reverse (digits n)) == (digits n)

-- this is super slow
palindromes = [ m * n | m <- [100 .. 999], n <- [100 .. 999], (is_palindrome (m * n)) == True ]

answer = maximum palindromes

{-

*Main> answer
906609

-}

-- writing out (10^2 a_2 + 10 a_1 + a_0)(10^2 b_2 + 10 b_1 + b_0), we find the conditions for it
-- to be a palindrome are
-- a_0 b_0 = a_2 b_2
-- a_1 b_0 + a_0 b_1 = a_2 b_1 + a_1 b_2
-- ***** nope, this is wrong when, e.g., a_2 b_2 > 10 *****

{-

full_space = [ [ a2, a1, a0, b2, b1, b0 ] | a0 <- [0..9], a1 <- [0..9], a2 <- [1..9],
	b0 <- [0..9], b1 <- [0..9], b2 <- [1..9] ]

restricted = [ x | x <- full_space, (x !! 0) * (x !! 3) == (x !! 2) * (x !! 5),
	(x !! 1) * (x !! 5) + (x !! 2) * (x !! 4) == (x !! 0) * (x !! 4) + (x !! 1) * (x !! 3) ]

palindromes = [ (100 * (x !! 0) + 10 * (x !! 1) + (x !! 2)) * (100 * (x !! 3) + 10 * (x !! 4) + (x !! 5)) |
	x <- restricted ]

answer = maximum palindromes

-}
