BEGIN {
    on = 1
}
/do\(\)/ {
    on = 1
    # print "do"
}
/don't\(\)/ {
    on = 0
    # print "don't"
}
/mul/ {
    if (on) {
      gsub("[^0-9,]","")
      split($0,nums, ",")
      sum += nums[1] * nums[2]
    }
}
END {
    print sum
}
