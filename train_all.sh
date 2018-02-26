#!/usr/bin/env bash
set -e

ref_images_dir=/export/home/asanakoy/workspace/gan_style/data/ref_style_images_1024x1024
ref_images=(`find $ref_images_dir -iname "*.jpg" -o -iname "*.png"`)

for ref_style_img_path in "${ref_images[@]}"
do
    base=$(basename "${ref_style_img_path}")
    style_name="${base%.*}"
    echo "style_name=${style_name}"

    python style.py --style "${ref_style_img_path}" \
      --checkpoint-dir "checkpoints/${style_name}" \
      --test /export/home/asanakoy/workspace/gan_style/data/content_images_1024x1024/golden_gate_bridge.jpg \
      --test-dir "test_results/${style_name}" \
      --content-weight 1.5e1 \
      --checkpoint-iterations 1000 \
      --batch-size 20

done
