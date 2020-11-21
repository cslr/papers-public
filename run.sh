#!/bin/sh

latex polyneuro
bibtex polyneuro
latex polyneuro
latex polyneuro
dvipdfm polyneuro.dvi
rm polyneuro.dvi

