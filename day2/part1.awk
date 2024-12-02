{
  sign = ($2 > $1) ? 1 : -1
  last = $1
  for (i = 2; i <= NF; i++) {
      diff = ($i - last) * sign
      if (diff <= 0 || diff > 3) {
          next
      }
      last = $i
  }
  sum++
}
END { print sum }
