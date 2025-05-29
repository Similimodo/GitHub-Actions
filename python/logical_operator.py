#!/ur/bin/env python3

# Logical operator = Used to check conditional statements
# And = Checks two or more condition, executes if True
# Or  = Checks if at least one condition is true
# Not = True if the condition is False, and vice versa

temp = int(input("What's your weather in Celsius: "))
sunny = bool(input("Enter True or False: "))

# AND logical statement
if temp > 0 and temp < 30:
    print(f"The weather is good at {temp}'C")
else:
     print(f"The weather is bad at {temp}'C")

# This can be rerun using OR logical statement
# OR logical statement
if temp <= 0 or temp >= 30:
    print(f"The weather is bad at {temp}'C")
else:
    print(f"The weather is good at {temp}'C")

if not sunny:
    print(f"It is cloudy outside!")
else:
    print(f"It is sunny outside!")