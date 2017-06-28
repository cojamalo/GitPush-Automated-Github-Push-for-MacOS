#!/bin/bash
git add .
git commit -m "Scripted auto-commit for change made on `date +%b%t%d,%t%Y` at `date +%T`"
git push
