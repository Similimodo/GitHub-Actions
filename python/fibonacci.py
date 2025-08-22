#!/usr/bin/env python3

def fibonaci(n): #defining the function
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    
    fib_seq = [0, 1]

    while len(fib_seq) < n:
        next_fib = fib_seq[-1] + fib_seq[-2]
        fib_seq.append(next_fib)
    return fib_seq


print(fibonaci(6))

