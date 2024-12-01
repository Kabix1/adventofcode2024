#!/usr/bin/env sh

cat input | awk '{print $1}' | sort > list1
cat input | awk '{print $2}' | sort > list2
paste list1 list2 | awk \
'function abs(x) {
  return ((x < 0.0) ? -x : x)
}
{
  nums[n]=$2
  count1[$1]+=1
  distance += abs($1 - $2)
  n+=1
}
END {
  print "part 1: " distance
  for (i = 0; i < n; i+=1)
  {
    sum += nums[i] * count1[nums[i]]
  }
  print "part 2: " sum
}'
