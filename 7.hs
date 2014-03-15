{-

https://projecteuler.net/problem=7

	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

	What is the 10 001st prime number?

-}

-- I've already set up all of the machinery in problem 3, so copy/paste:

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

answer n = primes !! (n - 1)

{-

*Main> answer 10001
104743

-}
