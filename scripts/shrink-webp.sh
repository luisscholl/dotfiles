for i in *; do
  o=${i%.*}
  magick "${i}" -resize 1080x1080 "${o}.webp";
  touch -r "${i}" "${o}.webp";
  rm "${i}";
done
