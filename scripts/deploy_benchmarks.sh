# Add all the benchmarks to a list in single json file.

out_dir=$1
name=${2:-"benchmarks"}
particular_dir=${3:-"particular"}

buffer=""

for file in $particular_dir/particular/benches/results/*.json; do
    buffer+=$(cat "$file")
    buffer+=","
done

echo "[${buffer%?}]" > $out_dir/$name.json
