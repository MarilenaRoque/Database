-- Question 1

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- Question 2

SELECT id, stadium, team1, team2
  FROM game WHERE id = 1012

-- Question 3

SELECT player, teamid, stadium, mdate
  FROM goal JOIN game ON (id=matchid) WHERE teamid = 'GER'

-- Question 4

SELECT team1, team2, player FROM game
JOIN goal ON matchid = id WHERE player LIKE 'Mario%'

-- Question 5

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (eteam.id=goal.teamid)
 WHERE gtime<=10

-- Question 6

SELECT mdate, teamname FROM game JOIN eteam ON (eteam.id = game.team1) WHERE coach = 'Fernando Santos';

-- Question 7

SELECT player FROM goal JOIN game ON (goal.matchid=game.id) WHERE stadium = 'National Stadium, Warsaw'

-- Question 8

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE ((team2='GER' OR team1 = 'GER') AND goal.teamid <> 'GER')

-- Question 9

SELECT DISTINCT teamname, COUNT(*) FROM goal 
 JOIN eteam ON (id=teamid) GROUP BY teamname

-- Question 10

SELECT stadium, COUNT(*) FROM game JOIN goal ON (game.id = matchid) GROUP BY stadium;

-- Question 11

SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON (matchid = id)  WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate; 

-- Question 12

SELECT goal.matchid, game.mdate, COUNT(matchid) FROM game JOIN goal  ON ( goal.matchid = game.id) WHERE goal.teamid = 'GER' GROUP BY matchid, mdate;

-- Question 13

SELECT DISTINCT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game JOIN goal ON matchid = id
  GROUP BY mdate, matchid, team1, team2
  ORDER BY mdate