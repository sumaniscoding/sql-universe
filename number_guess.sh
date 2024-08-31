#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

# Display the header
echo -e "\n~~~~~~ Number guessing game ~~~~~~\n"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

# Prompt for the username
echo -e "Enter your username:"
read USERNAME

# Check if user exists
EXISTING_USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")

if [[ -z $EXISTING_USER ]]
then
  ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT MIN(trys) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME';")

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

while [[ $USER_INPUT -ne $SECRET_NUMBER ]]
do
  read USER_INPUT
  if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  else
    if [[ $USER_INPUT -gt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    elif [[ $USER_INPUT -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    else
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
      INSERT=$($PSQL "INSERT INTO games(user_id, trys) VALUES($GET_USER_ID, $NUMBER_OF_GUESSES);")
    fi
  fi
done

#finished