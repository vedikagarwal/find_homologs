#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <query file> <subject file> <output file>"
  exit 1
fi

query_file="$1"
subject_file="$2"
output_file="$3"

blastn -query "$query_file" -subject "$subject_file" -outfmt "6 qseqid sseqid pident length qlen slen" | \
  awk '$3 == 100' > "$output_file"

match_count=$(wc -l < "$output_file")

echo "Number of perfect matches: $match_count"
