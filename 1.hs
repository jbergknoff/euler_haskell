sum_multiples max = sum [ k | k <- [ 1 .. max - 1 ], mod k 3 == 0 || mod k 5 == 0 ]
