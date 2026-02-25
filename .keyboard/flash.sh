#!/usr/bin/env bash

set -e 

qmk flash -kb ergodox_ez -m atmega32u4 ergodox_ez_glow_rice_ergodox_ez_glow.hex
