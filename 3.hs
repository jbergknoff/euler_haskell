{-

https://projecteuler.net/problem=3

	The prime factors of 13195 are 5, 7, 13 and 29.

	What is the largest prime factor of the number 600851475143 ?

-}

-- 6 * 10^11, so its square root is only about a million.

-- inspired by
-- http://stackoverflow.com/questions/9181767/haskell-understanding-a-solution-for-euler-3

primes = 2 : filter is_prime [ 3, 5 .. ]

is_prime n = (length (prime_factors n)) == 1

prime_factors n = prime_factors_from_list n primes
	where
		-- given a list of primes, which of those primes divide n?
		-- operate on the head of the list, p, and then recurse.
		prime_factors_from_list n (p:ps)
			| n == 1			= []
			-- if the first item in the list of primes is bigger than sqrt(n), then we are done.
			-- return [ n ], which is the initial input reduced by all the prime factors seen so far.
			| p * p > n			= [ n ]
			-- if p divides n, then return it in the list. divide through and try again (in case there
			-- are repeated powers).
			| mod n p == 0		= p : prime_factors_from_list (div n p) (p:ps)
			-- if p does not divide n, then move along.
			| otherwise			= prime_factors_from_list n ps

answer n = last (prime_factors n)

{-

*Main> answer 600851475143
6857

-}
