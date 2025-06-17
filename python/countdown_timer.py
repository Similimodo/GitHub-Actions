#!/usr/bin/env python3
import time

my_time = int(input("Enter timer in seconds: "))



print("Starting Timer Now!")
for a in range(0, my_time):
    print(a)
    time.sleep(4)

print("Time's Up!")