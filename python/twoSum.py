#
#	LeetCode answer for TwoSum
#	Question wants the function to return a pair of numbers
#		that equals to the targeted sum value of the pair.
#		The Valued pair cannot use the same number and
#		you can assume there will always be an answer
#
#	Takes in an array of integers and a targeted sum
#	Hash Table is used for faster processing
#
def twoSum(nums, target):
	hashTable = {}	#create an empty Hash Table
	for i in range(len(nums)):
		# get the 2nd number to fufill desired target
		diff = target - nums[i]
		# targeted pair is found if numbers exists in
		# the table and are not the same number
		if diff in hashTable and hashTable[diff] != i:
			return [hashTable[diff],i]
		# store number into the hashTable
		else:
			hashTable[nums[i]] = i

# Given values
givenArr = [2,7,11,15]
givenTarget = 9
print(twoSum(givenArr,givenTarget))