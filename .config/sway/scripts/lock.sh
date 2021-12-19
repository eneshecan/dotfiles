#!/usr/bin/env bash

B='#00000000'  # blank
C='#00000000'  # clear ish
D='#483018DD'  # default
T='#E0E0E0FF'  # text
W='#660000DD'  # wrong
V='#006600DD'  # verifying

swaylock \
--font=Jetbrains Mono    \
--inside-ver-color=$C    \
--ring-ver-color=$V      \
\
--inside-wrong-color=$C  \
--ring-wrong-color=$W    \
\
--inside-color=$B        \
--ring-color=$D          \
--line-color=$B          \
--separator-color=$D     \
\
--text-color=$T          \
--text-ver-color=$V      \
--text-wrong-color=$W    \
--layout-text-color=$D   \
--layout-border-color=$C \
--layout-bg-color=$B     \
--key-hl-color=$V        \
--bs-hl-color=$V         \
\
--screenshots            \
--effect-blur 6x6        \
--fade-in 0.2            \
--indicator-radius 100   \
--indicator-thickness 8  \
--clock                  \
--indicator              \
--timestr="%H:%M:%S"     \
--datestr="%a %d %b"     \
--show-keyboard-layout   \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
