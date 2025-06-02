#!/usr/bin/env python3
temp = float(input("Enter the temperature: "))
unit = input("Enter the temperature in Celsius or Fahrenheit (C/F): ")

if unit == "C":
    temp = round((temp * 9) / 5 + 32, 1)
    print(f"The temperature is {temp}'F")
elif unit == "F":
    temp = round((temp - 32) * 5 / 9, 1)
    print(f"The temperature is {temp}'C")
else:
    print(f"{unit} is invalid, please enter Celsius or Fahrenheit (C/F)!")
