#!/bin/bash

# Function to choose a text file
choose_file() {
  echo "Please enter the path to the text file:"
  read -r file_path

  if [[ ! -f $file_path ]]; then
    echo "File does not exist. Please try again."
    exit 1
  fi

  echo "File selected: $file_path"
}

# Function to find words based on user's choice
find_words() {
  echo "Do you want to search for words that (start) or (end) with a specific string? (Enter 'start' or 'end'):"
  read -r choice

  if [[ $choice != "start" && $choice != "end" ]]; then
    echo "Invalid choice. Please try again."
    exit 1
  fi

  echo "Please enter the string to search for:"
  read -r search_string

  if [[ $choice == "start" ]]; then
    echo "Words starting with '$search_string':"
    grep -o "\b$search_string\w*\b" "$file_path"
  else
    echo "Words ending with '$search_string':"
    grep -o "\b\w*$search_string\b" "$file_path"
  fi
}

# Function to count occurrences of a specific letter
count_letter() {
  echo "Please enter the letter you want to count:"
  read -r letter

  if [[ ${#letter} -ne 1 ]]; then
    echo "Please enter a single letter."
    exit 1
  fi

  count=$(grep -o "$letter" "$file_path" | wc -l)
  echo "The letter '$letter' occurs $count times in the file."
}

count_string() {
  echo "Please enter the string you want to count:"
  read -r string

  count=$(grep -o "$string" "$file_path" | wc -l)
  echo "The string '$string' occurs $count times in the file."
}

main_menu() {
  while true; do
    echo "Do you want to (1) search for words, (2) count a string or (3) count a letter? (Enter '1','2' or '3'):"
read -r action

    case $action in
      1)
        find_words
        ;;
      2)
        count_string
        ;;
      3)
        count_letter
        ;;
      q)
        echo "Exiting script."
        exit 0
        ;;
      *)
        echo "Invalid option. Please try again."
        ;;
    esac
    echo "Returning to main menu..."
    echo ""
  done
}

# Main script execution
choose_file
main_menu
