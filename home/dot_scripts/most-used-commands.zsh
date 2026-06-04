# I picked this one up somewhere, not sure where.
# I had to change `history` to `history 1` as `history` only outputs 15 entries by default in `zsh`

history 1 \
	| awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' \
	| grep -v "./" \
	| column -c3 -s " " -t \
	| sort -nr \
	| nl \
	| head -n10
