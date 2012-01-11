def pearson(x,y)
  n=x.length

  sumx=x.inject(0) {|r,i| r + i}
  sumy=y.inject(0) {|r,i| r + i}

  sumxSq=x.inject(0) {|r,i| r + i**2}
  sumySq=y.inject(0) {|r,i| r + i**2}

  prods=[]; x.each_with_index{|this_x,i| prods << this_x*y[i]}
  pSum=prods.inject(0){|r,i| r + i}

  # Calculate Pearson score
  num=pSum-(sumx*sumy/n)
  den=((sumxSq-(sumx**2)/n)*(sumySq-(sumy**2)/n))**0.5
  if den==0
    return 0
  end
  r=num/den
  return r
end