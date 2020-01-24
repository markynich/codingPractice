###############################################
# Script to get all combinations of a string
# without importing any modules
###############################################

#Function to calculate the factorial of a string's size.
#Takes 1 string parameter
def factorial(string):
	size = 1
	for i in range(len(string)):
		size = size * (i+1)
	return size

#Recursive function to find every combination of a string.
#Once the list is the same size as the string's size,
#it will print every combination
def permute(string, x = 0, theList = []):
	if x == len(string):
			#add permutation to list
		theList.append("".join(string))
			#print list when the list is same size as string
		if len(theList) == factorial(string):
			print theList
	else:
		for i in range(x,len(string)):
				#store string into a list
			strList = [j for j in string]
				#swap letters if they are different
			if i != x:
				strList[x], strList[i] = strList[i], strList[x]
				#recursive call to move to next letter
			permute(strList,x+1)
###########################
# Driver
###########################
permute('hero')
