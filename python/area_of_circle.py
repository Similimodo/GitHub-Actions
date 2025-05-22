#!/usr/bin/env python3
import math

#This code requests user input for radius and calculates the area of a circle 
radius = float(input("Enter the radius: "))

area = math.pi * pow(radius,2)
print(f"The area of the given radius {radius} is: {round(area,2)}cm ")

