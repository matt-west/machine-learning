from math import sqrt

# Returns a distance-based similarity score for item1 and item2
def euclidean_distance(prefs, item1, item2):
	si={}
	for item in prefs[item1]:
		if item in prefs[item2]:
			si[item]=1
	
	if len(si) == 0: return 0
	
	sum_of_squares = sum([pow(prefs[item1][item]-prefs[item2][item],2) for item in si])
	
	return 1/(1+sqrt(sum_of_squares))
	