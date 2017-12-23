#!/bin/bash

# This is my practice script on IF statement.

clear

echo -e "Please, enter your biology exam score: \c"
read SCORE

if (( "$SCORE" >= "90" )) && (( "$SCORE" <= "100" )) ; then
  echo "Congratulations, You got an 'A' grade!"


elif (( "$SCORE" >= "80" )) && (( "$SCORE" <= "89" )) ; then
  echo "You got a 'B' grade."


elif (( "$SCORE" >= "70" )) && (( "$SCORE" <= "79" )) ; then
  echo "You got a 'C' grade and You need to study and practice a lot."


elif (( "$SCORE" <= "69" )) ; then
  echo "You got a 'D'grade and You better hire a tutor and study hard."
else 
  echo "Your exceeded percentage."
fi
