# Returns a distance-based similarity score for item1 and item2
def euclidean_distance(p1,p2)
  sum_of_squares = 0
  p1.each_with_index do |p1_coord,index|
    sum_of_squares += (p1_coord - p2[index])**2
  end
  Math.sqrt(sum_of_squares)
end