function verify_update(raw_update, gt) {
    split(raw_update, update, ",")
    len = length(update)
    delete nums
    for (i1 = 1; i1 <= len; i1++) {
        nums[update[i1]] = ""
        split(gt[update[i1]], a, ",")
        for (j = 1; j <= length(a); j++) {
            if (a[j] in nums) {
                return 0
            }
        }
    }
    return update[int(len/2) + 1]
}
function update_score_sort(raw_update, gt) {
    split(raw_update, update, ",")
    swaps = 1
    while (swaps == 1) {
        swaps = sort_iteration(update, gt)
    }
    return update[int(len/2) + 1]
}
function sort_iteration(update, gt) {
    len = length(update)
    delete nums
    for (i1 = 1; i1 <= len; i1++) {
        nums[update[i1]] = i1
        split(gt[update[i1]], a, ",")
        for (j = 1; j <= length(a); j++) {
            if (a[j] in nums) {
                update[nums[a[j]]] = update[i1]
                update[i1] = a[j]
                return 1
            }
        }
    }
    return 0
}
BEGIN {FS="\\||,"}
/[0-9]+\|[0-9]+/ {
    if ($1 in gt) {
        gt[$1] = gt[$1] "," $2
    }
    else {
        gt[$1] = $2
    }
}
/[0-9]+,/{
    updates[length(updates)] = $0
}
END {
    for (i in updates) {
        middle = verify_update(updates[i], gt)
        sum += middle
        if (middle == 0) {
            bad_updates[length(bad_updates)] = updates[i]
        }
    }
    print "part 1:",sum
    for (i in bad_updates) {
        middle = update_score_sort(bad_updates[i], gt)
        bad_sum += middle
    }
    print "part 2:",bad_sum
}
