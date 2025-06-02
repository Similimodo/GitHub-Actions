#!/usr/bin/env python3

weight = float(input("Please enter your weight: "))
measurement = input("Enter either Kilograms or Pounds; (K or L)")

if measurement == "K" or measurement == "k":
    weight = round(weight * 2.205, 2)
    measurement = "LBs"
    print(f"Your measurement is {weight}{measurement}")
elif measurement == "L" or measurement == "k":
    weight = round(weight / 2.205, 2)
    measurement = "KGs"
    print(f"Your measurement is {weight}{measurement}")
else:
    print("Please enter the right measurement!")