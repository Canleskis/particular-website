path=$1
out_dir=$2
particular_dir=$3

metadata=$(grep -A3 "\[package.metadata.particular.rs\]" $path/Cargo.toml | grep -vE "^(#|\[)")

if [ -n "$metadata" ]; then
    name=$(basename $path)

    RUSTFLAGS='-C target-feature=+simd128' cargo build -p $name --release --target wasm32-unknown-unknown --manifest-path $particular_dir/Cargo.toml
    wasm-bindgen --no-typescript --out-name example --out-dir $out_dir/$name --target web $particular_dir/target/wasm32-unknown-unknown/release/$name.wasm

    cp $path/preview.png $out_dir/$name/preview.png
    cp -r $path/assets $out_dir/$name/assets 2>/dev/null

    echo '+++
'"$metadata"'
template = "demo.html"
+++' >$out_dir/$name/index.md
fi
