# Textman
Textman is, self-explanatory, a text(Words and Letters) Inspector or a Bash script for searching text files with optionality.

### Explanation:
1. **main_menu function**: This function runs an infinite loop (`while true`) that presents the user with options to either search for words, count a string, count a letter or quit the script. After each action is completed, the user is returned to the main menu.
2. **Returning to Main Menu**: The `return` command in the `find_words`, `count_string` and `count_letter` functions ensures that the script goes back to the main menu after executing these functions.
3. **Exiting the Script**: If the user enters 'q', the script exits.

### Usage:
1. Make it executable with `chmod +x textman.sh`.
3. Run the script: `./textman.sh`.
