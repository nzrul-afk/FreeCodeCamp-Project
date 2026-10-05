#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

declare -A SEEN
TEAMS_VALUES=""
GAMES_VALUES=""

while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    for TEAM in "$WINNER" "$OPPONENT"
    do
      if [[ -z ${SEEN[$TEAM]} ]]
      then
        SEEN[$TEAM]=1
        TEAMS_VALUES+="('$TEAM'),"
      fi
    done

    GAMES_VALUES+="($YEAR, '$ROUND', (SELECT team_id FROM teams WHERE name='$WINNER'), (SELECT team_id FROM teams WHERE name='$OPPONENT'), $WINNER_GOALS, $OPPONENT_GOALS),"
  fi
done < games.csv

echo $($PSQL "INSERT INTO teams(name) VALUES ${TEAMS_VALUES%,}")
echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ${GAMES_VALUES%,}")