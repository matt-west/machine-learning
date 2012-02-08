#!/usr/bin/env ruby 

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

# Returns a distance-based similarity score for item1 and item2
def euclidean_distance(prefs, p1, p2)
  si = []
  
  prefs[p1].each do |item|
    prefs[p2].each do |p2_film|
      if item[0] == p2_film[0]
        si << item[0]
      end
    end
  end
  
  if si.length == 0
    return 0
  end
  
  sum_of_squares = 0
  
  si.each do |item|
    item_sum = (prefs[p1][item]-prefs[p2][item])**2
    puts item_sum
    sum_of_squares += item_sum
  end
  
  return 1/(1+Math.sqrt(sum_of_squares))
end