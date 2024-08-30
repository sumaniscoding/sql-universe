#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  INPUT=$1
  
  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    DATA=$($PSQL "select * from elements left join properties using(atomic_number) left join types using(type_id) WHERE name='$INPUT' OR symbol='$INPUT';")
    if [[ -z $DATA ]]
    then
      echo -e "I could not find that element in the database."
    else
      echo "$DATA" | while read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_SYMBOL BAR NAME BAR MASS BAR MELT BAR BOIL BAR TYPE
      do
        #echo $DATA
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($ATOMIC_SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
      done 
    fi 
  else
    DATA=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$INPUT;")
    if [[ -z $DATA ]]
    then
      echo -e "I could not find that element in the database."
    else
      echo "$DATA" | while read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_SYMBOL BAR NAME BAR MASS BAR MELT BAR BOIL BAR TYPE
      do
       echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($ATOMIC_SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
      done 
    fi 
  fi
else
  echo -e "Please provide an element as an argument."
fi