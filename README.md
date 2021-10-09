# uae4all for Raspberry Pi

Very fast amiga emulator suitable for raspberry pi one and zero.

Emulate an amiga 500.

Need kick.rom file containing kickstart 1.3

How to compile:

   Retrieve the source of this emulator:

      git clone https://github.com/Chips-fr/uae4all-rpi
      cd uae4all-rpi

   Install following packages:

      sudo apt-get install libsdl1.2-dev 
      sudo apt-get install libsdl-gfx1.2-dev

   Then :

      make

For even faster emulation speed (but lower compatibility) uncomment in makefile CYCLONE_CORE and comment FAME_CORE.