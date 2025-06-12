#!/usr/bin/env python3

# For loop = Executes a block of code a fixed number of times.
#            You can iterate over a string, range or sequence etc.

# # Count from 1 to 10
# for i in range(1, 11):
#     print(i)
# print("Happy")

# # Count backwards from 10 to 1
# for i in reversed(range(1, 11)):
#     print(i)
# print("Happy")

# # Count from 1 to 10 by 2s
# for i in range(1, 11, 2):
#     print(i)
# print("Happy")



# # Iterates over a string
# credit_card = "1234-5678-4321-8765"

# for i in credit_card:
#     print(i)

# Skips over a number in this case 13
for i in range(1, 21):
    if i == 13:
        continue
    else:
        print(i)