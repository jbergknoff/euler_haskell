{-

https://projecteuler.net/problem=1

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

-}

sum_multiples max = sum [ k | k <- [ 1 .. max - 1 ], mod k 3 == 0 || mod k 5 == 0 ]
