# Metal Gear (RC750, MSX2)

This repository contains the fully annotated disassembly of the original Metal Gear game, released by Konami for [MSX2](https://en.wikipedia.org/wiki/MSX) in 1987 with code RC750. I hope you will find the code comments useful to understand how the game works.


## Why?

I like to learn how things work, and to explain to others what I have learned.

This was a good oportunity to find out how Konami made games in the old good days, how all their games use the same structure, how they reused the same "libraries" in different games (e.g. the routine used to calculate the trajectory of a shot), etc.

Also, I like to find oddities (unused graphics, rooms, texts, musics, code...) and find bugs.

Last but not least, I wanted to be able to modify the game in order to fix bugs, and make it work on different MSX models (e.g. my MSX Turbo R can't save or load game data because it does not have a cassette port).


## How to assemble

Use [Sjasm 0.39](https://github.com/Konamiman/Sjasm) or a compatible assembler:

    sjasm MetalGear.asm MetalGear.rom


## Japanese vs English versions

It is possible to build both Japanese (CRC32 FAFE1303) and English (CRC32 E85C5731) versions of the game, by setting the `JAPANESE` constant to 1 or 0 in the `MetalGear.asm` file.

The Japanese version is region locked, this means that it won't work on a MSX computer with a non-Japanese ROM (the computer will just reset). If you want to disable the region lock just change the `logic/regionlock.asm` file so that it just contains this:

    RegionLock:
      ret


## Legal notice

This repository is provided "as is" for education purposes only. Any non-educational use of this repository might be illegal if you do not own an original copy of the game.

Also, the repository will be removed if Konami or their legal representatives ask me to do so.
