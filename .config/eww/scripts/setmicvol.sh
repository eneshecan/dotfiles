#!/usr/bin/env bash

vol=${1}
pamixer --default-source --set-volume ${vol%.*}

