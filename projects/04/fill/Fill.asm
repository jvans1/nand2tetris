// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.  
// Put your code here.
@24576
D=A
@endpix
M=D

@SCREEN
D=A
@startpix
M=D

@0
D=A
@previnput
M=D

(LISTEN)
  @KBD
  D=M
  @currinput
  M=D
  @previnput
  D=M-D
  @DRAW
  D;JNE
  @LISTEN
  0;JMP

(DRAW)
  @endpix
  D=M
  @startpix
  D=D-M
  @END
  D;JEQ
  @startpix
  D=M
  A=D
  M=!M
  @1
  D=A
  @startpix
  D=D+M
  M=D
  @DRAW
  0;JMP

(END)
  @currinput
  D=M
  @previnput
  M=D
  @SCREEN
  D=A
  @startpix
  M=D
  @LISTEN
  0;JMP
