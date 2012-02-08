#!/usr/bin/env ruby 

# Some data to test with
Critics = {
  'Lisa Rose' => {
    'Lady in the Water' => 2.5,
    'Snakes on a Plane' => 3.5,
    'Just My Luck'  => 3.0,
    'Superman Returns' => 3.5,
    'You, Me and Dupree' => 2.5,
    'The Night Listener' => 3.0
  },
  'Gene Seymour' => {
    'Lady in the Water' => 3.0,
    'Snakes on a Plane' => 3.5,
    'Just My Luck'  => 1.5,
    'Superman Returns' => 5.0,
    'You, Me and Dupree' => 3.5,
    'The Night Listener' => 3.0
  },
  'Michael Phillips' => {
    'Lady in the Water' => 2.5,
    'Snakes on a Plane' => 3.0,
    'Superman Returns' => 3.5,
    'The Night Listener' => 4.0
  },
  'Claudia Puig' => {
    'Snakes on a Plane' => 3.5,
    'Just My Luck'  => 3.0,
    'Superman Returns' => 4.0,
    'You, Me and Dupree' => 2.5,
    'The Night Listener' => 4.5
  },
  'Mick LaSalle' => {
    'Lady in the Water' => 3.0,
    'Snakes on a Plane' => 4.0,
    'Just My Luck'  => 2.0,
    'Superman Returns' => 3.0,
    'You, Me and Dupree' => 2.0,
    'The Night Listener' => 3.0
  },
  'Jack Matthews' => {
    'Lady in the Water' => 3.0,
    'Snakes on a Plane' => 4.0,
    'Superman Returns' => 5.0,
    'You, Me and Dupree' => 3.5,
    'The Night Listener' => 3.0
  },
  'Toby' => {
    'Snakes on a Plane' => 4.5,
    'Superman Returns' => 4.0,
    'You, Me and Dupree' => 1.0
  }
}

# Returns a distance-based similarity score for p1 vs p2
def euclidean_distance(prefs, p1, p2)
  si = [] # Empty array for films that can be compared (both user's have rated)
  
  prefs[p1].each do |item| # Loop through each rating for p1
    prefs[p2].each do |p2_film| # Loop through each rating for p2
      if item[0] == p2_film[0] # If both people have rated this film add it to the films array
        si << item[0]
      end
    end
  end
  
  # If there are no films that both people have rated stop here and return 0
  if si.length == 0
    return 0
  end
  
  sum_of_squares = 0 # For the sum of all the distances
  
  si.each do |item|
    # Calculate the distance between the two ratings in the rating graph
    sum_of_squares += (prefs[p1][item]-prefs[p2][item])**2
  end
  
  # Add 1 to the square root of sum_of_squares and divide it all by 1.
  # This gives a value that is large for people that are more similar
  # 0 = Totally Unique / 1 = Identical
  return 1/(1+Math.sqrt(sum_of_squares))
end
