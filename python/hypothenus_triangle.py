#!/usr/bin/env python3
import math

#This code requests user inputs for the two sides and calculates the hypothenus of a triangle
a = float(input("Enter the side A: "))
b = float(input("Enter the side B: "))

c = math.sqrt(pow(a,2) + pow(b,2))
print(f"The hypothenus of the given a {a} and b {b} is: {round(c,2)}cm ")