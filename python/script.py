def myfunc(myStr):
    newStr = ""
    for i in range(len(myStr)):
        if i % 2 == 0:
            newStr = newStr + myStr[i].upper()
        else:
            newStr = newStr + myStr[i].lower()
    return newStr
print(myfunc("Go get em Spongebob"))
