#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
  #check team exists
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $WINNER_ID ]]
    then
      WINNER_INSERT_CHECK=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $WINNER_INSERT_CHECK == "INSERT 0 1" ]]
      then
        echo "Team added: $WINNER"
      fi
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_INSERT_CHECK=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $OPPONENT_INSERT_CHECK == "INSERT 0 1" ]]
      then
        echo "Team added: $OPPONENT"
      fi
    fi


   # TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' OR name='$OPPONENT'")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")


    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo -e "Inserted game detail
        \nYear: $YEAR
        \nRound: $ROUND
        \nWinner goals: $WINNER_GOALS
        \nOpponent goals: $OPPONENT_GOALS
        \nWinner id: $WINNER_ID
        \nOpponent id:$OPPONENT_ID "
      fi

    echo "winner id - $WINNER_ID OPP ID - $OPPONENT_ID"


  fi
  
done