{-

https://projecteuler.net/problem=5

	2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

	What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

-}

{-

2 = 2				2
3 = 3				3
4 = 2^2				2
5 = 5				5
6 = 2 * 3
7 = 7				7
8 = 2^3				2
9 = 3^2				3
10 = 2*5
11 = 11				11
12 = 2^2 * 3
13 = 13				13
14 = 2 * 7
15 = 3 * 5
16 = 2^4			2
17 = 17				17
18 = 2 * 3^2
19 = 19				19
20 = 2^2 * 5

for 10, 2 * 3 * 2 * 5 * 7 * 2 * 3 = 360 * 7 = 2520
for 20, 2520 * 11 * 13 * 2 * 17 * 19 = 232,792,560

really what I want is LCM(1,2,...,20). LCM is nestable: LCM(x, y, z) = LCM(x, LCM(y, z))

-}

-- is it cheating to use built-in LCM?
answer = foldr lcm 1 [1..20]

{-

*Main> answer
232792560

-}
