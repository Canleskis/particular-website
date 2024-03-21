# Add all the benchmarks to a list in single json file.

particular_dir=${1:-"particular"}
name=${2:-"benchmarks"}
out_dir=${3:-"content/benchmarks"}

buffer=""

for file in $particular_dir/particular/benches/results/*.json; do
    buffer+=$(cat "$file")
    buffer+=","
done

echo "[${buffer%?}]" > $out_dir/$name.json
