# LexAnalyzerLab
Lexical Analyzer for AC Language

Purpose: Build a lexical analyzer that recognizes comments, declarations, assignments, and print statements in the AC teaching language. This is part of the compiler front‑end lab.

Repository Structure

lexanalyzer/
├── Makefile
├── README.md
├── source/
│   └── analyzer.l
├── code_generator.py
└── tests/
    ├── test1.ac
    ├── ref1.txt
    ├── test2.ac
    ├── ref2.txt
    ├── test3.ac
    ├── ref3.txt
    ├── test4.ac
    └── ref4.txt

Makefile: Build & test rules

source/analyzer.l: Flex lexer specification

code_generator.py: Script to generate random .ac test files

tests/: Sample inputs (.ac) and expected outputs (.txt)

Prerequisites

macOS or Linux

Xcode Command‑Line Tools (macOS):

xcode-select --install

flex (install via Homebrew if needed):

brew install flex

gcc, make (provided by Command‑Line Tools)

Build Instructions

From project root:

make

Runs flex on source/analyzer.l

Compiles lex.yy.c into lex_analyzer executable

To clean build artifacts:

make clean

Usage

Analyze a single AC source file:

./lex_analyzer tests/test1.ac

Expected output for test1.ac:

COMMENT
float_decl identifier
int_decl identifier
id_assign_int
id_assign_id_plus_float
print identifier
COMMENT

Automated Testing

Run all provided tests and verify against reference outputs:

make test

You should see:

✅ All tests passed!

Generating Additional Tests

To create a random test file with 50 lines:

make generate

This produces tests/test_generated.ac. You can then run:

./lex_analyzer tests/test_generated.ac

Coding Standards

Compiler flags: -std=c11 -Wall -Wextra (zero warnings ideally)

Indentation: 4 spaces, no tabs

Flex options: use %option noyywrap

Comments: Document each regex rule in analyzer.l

Naming: snake_case for variables and functions

User Manual

Build

make

Run

./lex_analyzer <source.ac>

Verify

make test

Extend

Add new patterns in source/analyzer.l

Add corresponding .ac and .txt in tests/

Rerun make test
