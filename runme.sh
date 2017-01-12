#!/usr/bin/env bash
export TEXINPUTS="~/texmf:./texmf:$TEXINPUTS"
java -cp /opt/language_tool/3.5/languagetool-server.jar org.languagetool.server.HTTPServer --port 8081 &>/dev/null &
xelatex main.tex && biber main && xelatex main.tex
