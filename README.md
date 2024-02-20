# README for Context-Free Grammar Parser Project

## Team Members:
- Esraa Ashraf Ibrahim Mohammed
- Eman Amr Ali Hamed
- Esraa Abd-El-Maksood
- Aya ElSayed Mohammed

## Project Overview:
This project is a Context-Free Grammar (CFG) parser implemented in Prolog. It parses source code written in a specific grammar defined in the project and checks for syntax errors.

## Features:
- **Parsing**: Parses source code according to the defined CFG rules.
- **Error Checking**: Identifies syntax errors in the source code.
- **Input**: Reads source code from a file.
- **Output**: Prints the parsed tokens and identifies if the code is syntax-free or contains errors.

## Usage:
1. Ensure you have a Prolog interpreter installed on your system.
2. Clone or download the project files to your local machine.
3. Open your Prolog interpreter and consult the main file (e.g., `main.pl`).
4. Run the `parser` predicate to start parsing the source code.
5. Provide the path to the source code file when prompted.

## Project Structure:
- `main.pl`: Main Prolog file containing the parser logic and predicates.
- `grammar.pl`: Defines the CFG rules for parsing.
- `input.txt`: Example input file containing source code to be parsed.

## Example Usage:
```prolog
?- parser.
Enter the path to the source code file: input.txt.

--- Tokens ---

% Display parsed tokens here %

Parsing Done, Syntax Free!
