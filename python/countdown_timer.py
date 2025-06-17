#!/usr/bin/env python3
import time

my_time = int(input("Enter timer in seconds: "))


def start_timer():
    print("Starting Timer Now!")
    for a in range(0, my_time):
        print(a)
        time.sleep(4)

    print("Time's Up!")

# start_timer()

def start_timer_reverse():
    print("Starting Timer Now!")
    for b in range(my_time, 0, -1):
        print(b)
        time.sleep(4)
    print("Time's UP!")
# start_timer_reverse()


def digital_timer():
    print("Starting Timer Now.")
    print("Starting Timer Now..")
    print("Starting Timer Now...")

    
    for c in range(my_time, 0, -1):

        seconds = c % 60
        print(f"00:00:{seconds:02}")
        time.sleep(4)

    print("Time's Up!")

digital_timer()

