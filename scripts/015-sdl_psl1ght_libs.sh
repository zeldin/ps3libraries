#!/bin/sh -e
# sdl_psl1ght_libs.sh by Naomi Peori (naomi@peori.ca)

## Download the source code.
../download.sh submodules/SDL_PSL1GHT_Libs

## Unpack the source code.
rm -Rf sdl_psl1ght_libs && mkdir sdl_psl1ght_libs && git --git-dir=../submodules/SDL_PSL1GHT_Libs/.git --work-tree=sdl_psl1ght_libs checkout-index -a

## Use any already downloaded archives from submodules dir
for i in ../submodules/SDL_PSL1GHT_Libs/archives/*; do
  case "$i" in
    */archives.txt) ;;
    *) [ -f "$i" ] && ln "$i" sdl_psl1ght_libs/archives/ ;;
  esac
done

## Create the build directory.
cd sdl_psl1ght_libs

## Compile and install.
./make_SDL_Libs.sh
