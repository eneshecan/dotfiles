#!/usr/bin/env bash

B='#00000000'  # blank
C='#000000AA'  # clear ish
D='#483018DD'  # default
T='#E0E0E0FF'  # text
W='#660000DD'  # wrong
V='#006600DD'  # verifying

swaylock \
--daemonize              \
--font=Jetbrains Mono    \
--font-size=24           \
--inside-ver-color=$B    \
--ring-ver-color=$V      \
\
--inside-wrong-color=$B  \
--ring-wrong-color=$W    \
\
--inside-color=$C        \
--ring-color=$D          \
--line-color=$B          \
--separator-color=$D     \
\
--text-color=$T          \
--text-ver-color=$V      \
--text-wrong-color=$W    \
--layout-text-color=$T   \
--layout-border-color=$B \
--layout-bg-color=$C     \
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
--timestr="%I:%M %p"     \
--datestr="%a %d %b"     \
--show-keyboard-layout   \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
