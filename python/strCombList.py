###############################################
# Script to get all combinations of a string
# and store into a list
# Used 1 module "from itertools import permutations"
###############################################
from itertools import permutations

def permute(string):
	perm = ["".join(p) for p in permutations(string)]
		#remove any repetitive combinations
	s = set(perm)
		#return as a list
	return list(s)
###########################
# Driver
###########################
strList = permute('hero')
print strList[0]