{-

https://projecteuler.net/problem=9

	A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

	a^2 + b^2 = c^2
	For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

	There exists exactly one Pythagorean triplet for which a + b + c = 1000.
	Find the product abc.

-}

{-

Pythagorean triples can be parametrized as

	a = m^2 - n^2
	b = 2mn
	c = m^2 + n^2

interested in positive a, so take m > n and n >= 1.
e.g. smallest triple is then m = 2, n = 1: (a, b, c) = (3, 4, 5).

1000 = a + b + c= 2m(m+n)
m(m+n) = 500 = 2^2 * 5^3

n < m < sqrt(500) ~= 23

-}

mn_space = [ (m, n) | n <- [1 .. 23], m <- [n+1 .. 23] ]
solution = [ p | p <- mn_space, (fst p) * ((fst p) + (snd p)) == 500 ] !! 0
answer = ((fst solution)^4 - (snd solution)^4) * 2 * (fst solution) * (snd solution)

{-

*Main> answer
31875000

-}
