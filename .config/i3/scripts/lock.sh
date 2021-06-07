#!/usr/bin/env bash

B='#00000000'  # blank
C='#00000000'  # clear ish
D='#483018DD'  # default
T='#E0E0E0FF'  # text
W='#660000DD'  # wrong
V='#006600DD'  # verifying

i3lock \
--insidever-color=$C   \
--ringver-color=$V     \
\
--insidewrong-color=$C \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$D        \
--line-color=$B        \
--separator-color=$D   \
\
--verif-color=$T       \
--wrong-color=$T       \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$W       \
--bshl-color=$W        \
\
--screen 1             \
--blur 10              \
--clock                \
--indicator            \
--time-str="%H:%M:%S"  \
--date-str="%a %d %b"  \
--keylayout 1          \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
