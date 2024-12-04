BEGIN { j = 1; FS="" }
function idx(row, col, num_cols) {
    return (row - 1) * num_cols + col
}

{
    for (i = 1; i <= NF; i++) {
        if ($i == "M") lines[j] = 1
        else if ($i == "A") lines[j] = 2
        else if ($i == "S") lines[j] = 4
        else lines[j] = 8
        j += 1
    }
}
END {
    num_cols = NF
    num_rows = length(lines) / num_cols
    for (i = 2; i < num_cols; i++)
        for (j = 2; j < num_rows; j++) {
            if ((lines[idx(j, i, num_cols)] == 2) &&
                (lines[idx(j + 1, i + 1, num_cols)] + lines[idx(j - 1, i - 1, num_cols)] == 5) &&
                (lines[idx(j - 1, i + 1, num_cols)] + lines[idx(j + 1, i - 1, num_cols)] == 5)) {
                xmases += 1
            }
        }
    print xmases
}
