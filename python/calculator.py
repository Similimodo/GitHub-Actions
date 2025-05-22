#!/usr/bin/env python3

operator = input("Enter the desired operator: (+ - * /)")
num1 = float(input("Enter the 1st number: "))
num2 = float(input("Enter the 2nd number: "))

if operator == "+":
     print(num1 + num2)
elif operator == "-":
     print(num1 - num2)
elif operator == "*":
     print(num1 * num2)
elif operator == "/":
     print(num1 / num2)
else:
     print("Enter the correct operator!")
