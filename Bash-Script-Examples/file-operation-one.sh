# A script to find and delete files older than a certain number of days in a specified directory.

read -p "Enter the file name: " file
read -p "Enter the number of days older to be deleted: " days

# Find and delete files older than the specified number of days
find / -type f -iname "$file" -mtime +"$days" -exec rm -f {} \;


read -p "Enter the filename: " search_relace_filename
read -p "Enter the word to be searched with: " search_word
read -p "Enter the word to be replaced with: " replace_word

sed -e /s/$search_word/$replace_word/g $search_relace_filename
echo "Replaced all occurrences of '$search_word' with '$replace_word' in '$filename'."