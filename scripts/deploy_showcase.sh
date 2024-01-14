particular_dir=${1:-"particular"}

for subfolder in $particular_dir/examples/*; do
    if [ -d $subfolder ]; then
        bash scripts/deploy_example.sh $subfolder content/demos $particular_dir
    fi
done
