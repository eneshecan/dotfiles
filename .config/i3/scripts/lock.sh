#!/bin/sh

B='#00000000'  # blank
C='#00000000'  # clear ish
D='#483018DD'  # default
T='#E0E0E0FF'  # text
W='#660000DD'  # wrong
V='#006600DD'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T       \
--wrongcolor=$T       \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 10             \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%a %d %b"  \
# --keylayout 1         \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
