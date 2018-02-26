#!/usr/bin/env bash
set -e

ref_images_dir=/export/home/asanakoy/workspace/gan_style/data/ref_style_images_1024x1024
ref_images=(`find $ref_images_dir -iname "*.jpg" -o -iname "*.png"`)

for ref_style_img_path in "${ref_images[@]}"
do
    base=$(basename "${ref_style_img_path}")
    style_name="${base%.*}"
    echo "style_name=${style_name}"

    python evaluate.py --checkpoint "checkpoints/${style_name}" \
      --name-suffix "${style_name}" \
      --img_size 768 \
      --in-path /export/home/asanakoy/workspace/gan_style/data/content_images_1024x1024 \
      --out-path output_val_768x768

done

