#!/usr/bin/env python3
item = input("Enter the item you want: ")
price = float(input("The price is: "))
quantity = int(input("How many quantities do you need: "))

total = price * quantity
print("")
print(f"The total purchase price is: ${round(total, 2)}") #rounding the decimal places to 2