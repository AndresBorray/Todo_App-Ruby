# Todo_App-Ruby
ToDo_Board App -- written in Ruby

Part of my journey in teaching myself how to code. Starting at a place of close to zero knowledge-- I'm pretty proud of this rinky dink app...even if you can only use it via command line. Big props to App Academy Coding Bootcamp for making their full curriculum available for free online. Tracking on github so that I can look back one day and scoff at what a horrible coder I was....and to recognize how far I have hopefully come. Good job future me. 

Three Class files. Program can be run by launching the Todo_board.rb file via the command line using the "ruby" command. The app allows for multiple to-do lists each with their own name and to-dos. A to-do item must have a title and a deadline (YYYY-MM-DD), and can have an optional description. 

The viable commands are (must be one-word with a space in between each command): 

mklist <listname> - create a new list with the name specified
ls - lists all list names
mktodo <listname> <todo title> <deadline> <optional description> - creates a todo item under the list specified
showall - shows all lists and items
up <listname> <index> <optional: number of lines to move up> - moves to-do item up by the optional amount of rows
down <listname> <index> <optional: number of lines to move down> - moves to-do item down by the optional amount of rows
swap <listname> <index numbers to switch> - swaps the two to-dos
sort <listname>  - sorts via deadline
priority <listname> - displays the top item of the specified list
toggle <listname> <index> - changes the status of the specified todo item from True/ Complete to False/ Not Complete and vise versa. 
purge <listname> - deletes all items with complete/true status
print <listname> <optional index> - displays the specified to do list or the specific item index if listed 
quit - exit program
rm <listname> <index> - deletes the specified todo item 
  
 
