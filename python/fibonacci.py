#!/usr/bin/env python3

def fibonaci(n): #defining the function
    if n <= 0: # return an empty list if the number is 0 or neagtive number
        return []
    elif n == 1: #return a list starting from 0 if the number greater than 0  
        return [0]
    
    fib_seq = [0, 1] # Set the list of the sequence starting with 0

    while len(fib_seq) < n: # run the code below if the length of the list of seq is less than n
        next_fib = fib_seq[-1] + fib_seq[-2]
        fib_seq.append(next_fib)
    return fib_seq


print(fibonaci(3))

