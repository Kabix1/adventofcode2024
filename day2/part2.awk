function check_safe(numbers) {
    sign = (numbers[2] > numbers[1]) ? 1 : -1
    sign2 = (numbers[3] > numbers[2]) ? 1 : -1
    sign = (sign == sign2) ? sign : (numbers[4] > numbers[3]) ? 1 : -1
    max = length(numbers)
    for (i = 2; i <= max; i++) {
        diff = (numbers[i] - numbers[i-1]) * sign
        if (diff <= 0 || diff > 3) {
            return i
        }
    }
    return 0
}
{
    if (NF == 2) { sum++; next }
    split($0, all)
    unsafe = check_safe(all)
    if (unsafe == 0) { sum++; next}
    offset = 0
    split("",list1)
    split("",list2)
    for (i = 1; i <= NF; i++) {
        if (i == unsafe) continue
        list1[length(list1)+1] = all[i]
    }
    for (i = 1; i <= NF; i++) {
        if (i+1 == unsafe) continue
        list2[length(list2)+1] = all[i]
    }
    if (check_safe(list1) == 0 || check_safe(list2) == 0) sum++
}
END { print sum }
