# Carwow technical test

A program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

## Program input

The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.
Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

## Commands

There are 6 supported commands:
I N M - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image

## Run application

By pressing the 'Run Main' button above it will run the application against the examples provided in the examples folder
By pressing 'Run Tests' it will run the test suite.

## Entry points for the application

The code starts in /lib/editor.rb (The script is called from /bin/editor, but that part is not important)
Tests are in the /spec folder
