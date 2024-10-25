resize_flag='1920'

print_usage() {
	printf "Converts all images in folder to webp and deletes input images."
	printf ""
	printf "Usage: webp"
	printf ""
	printf "Options"
	printf "-r [pixels] Resize image to fit within width and height"
}

while getopts 'r:' flag; do
	case "${flag}" in
		r) resize_flag="${OPTARG}" ;;
	esac
done

for i in *; do
  o=${i%.*}
	if ! command -v magick 2>&1 >/dev/null
	then
		convert "${i}" -resize "${resize_flag}x${resize_flag}" "${o}.webp";
	else
		magick "${i}" -resize "${resize_flag}x${resize_flag}" "${o}.webp";
	fi
  touch -r "${i}" "${o}.webp";
  rm "${i}";
done
