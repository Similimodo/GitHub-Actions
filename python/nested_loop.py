#!/usr/bin/env python3
# Nested loop = A loop within another loop (outer and inner)
#               outer loop:
#                   inner loop:



def print_in_one_line():

    for i in range(1, 11):
        print(i, end= "")

# print_in_one_line() 

def one_line_three_times():
    for a in range(3):
        for b in range(1,11):
            print(b, end="")

# one_line_three_times()

def print_in_new_line():
    for c in range(4):
        for d in range(1,11):
            print(d, end="")
        print()

# print_in_new_line()

def rows_columns():
    rows = int(input("Enter the number of rows: "))
    columns = int(input("Enter the number of columns: "))
    symbol = input("Symbol of choice: ")

    for e in range(rows):
        for f in range(columns):
            print(symbol, end="")
        print()

rows_columns()