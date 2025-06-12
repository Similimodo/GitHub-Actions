#!/usr/bin/env python3

# total = principal * (1 + rate/100)time

principal = 0
rate = 0
time = 0

while principal <= 0:
    principal = float(input("Enter the principal amount: $"))
    if principal <= 0:
        print("Principal cannot be less than or equals to zero")
while rate <= 0:
    rate = float(input("Enter the rate amount: "))
    if rate <= 0:
        print("rate cannot be less than or equals to zero")

while time <= 0:
    time = int(input("Enter the time in years: "))
    if time <= 0:
        print("time cannot be less than or equals to zero")

print("")
print("")

print(f"The principal is: ${principal}")
print(f"The rate is: {rate}%")
print(f"The time is: {time}years ")
print("")
print("")

compound_interest = principal * pow((1 + rate/100),time)
print(f"The compound interest is: ${compound_interest:.2f} ")
print("")
