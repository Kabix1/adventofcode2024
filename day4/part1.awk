BEGIN { j = 1; FS="" }

{
    for (i = 1; i <= NF; i++) {
        lines[j] = $i
        j += 1
    }
}
END {
    # print lines[5]
    num_cols = NF
    num_rows = length(lines) / num_cols
    for (i = 1; i <= num_cols; i++)
        for (j = 1; j <= num_rows; j++) {
            c = lines[i + num_cols * (j - 1)]
            rows[j] = rows[j] c
            cols[i] = cols[i] c
            diags1[i + j - 1] = diags1[i+j-1] c
            diags2[num_cols - i + j] = diags2[num_cols-i+j] c
        }
    for (row in rows) print rows[row]
    for (col in cols) print cols[col]
    for (diag in diags1) print diags1[diag]
    for (diag in diags2) print diags2[diag]
}
