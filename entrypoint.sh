#!/bin/sh -l

curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
./lit install Lautenschlager-id/fromage

./luvit tools/bot.lua $1 $2 $3 $4