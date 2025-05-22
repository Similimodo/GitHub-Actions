# If Statement is used to do something whenever the condition is True, else do something else
def age():
    age = int(input("How old are you? :"))
    teen = str("20 years")

    if age >= 50:
        return print(f"Your age is {age} years and you are a seniorman")
    elif age >= 20:
        return print(f"You are an adult because your age {age} years is above {teen}!")
    elif age <= 0:
        return print(f"You have not been born yet given the number of age - {age} years you entered!")
    else:
        return print(f"You are a teeneger because your age {age} years is under {teen}!")



def food():
    response = input("Would you like food? (Enter: Y/N)")
    if response == "Y":
        return print("Have some food!")
    else:
        return print("No food for you!")
    
def naming():
    name = input("Please enter your name: ")

    if name == "":
        return print("You haven't enter any name")
    else:
        return print(f"Hello {name}")

def boolane():
    for_sale = True
    if for_sale:
        return print("Item is for sale.")
    else:
        return print("Item is not for sale")


age()
food()
naming()
boolane()  