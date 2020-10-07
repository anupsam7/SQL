-- The tables containing information about Euro 2012 matches are as follows:

-- game with columns id, mdate, stadium, team1, team2
-- goal with columns matchid, teamid, player, gtime
-- eteam with columns id, teamname, coach


-- show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid
	,player
FROM goal
WHERE teamid = 'GER'

-- Show id, stadium, team1, team2 for just game 1012
SELECT id
	,stadium
	,team1
	,team2
FROM game
WHERE id = 1012

-- show the player, teamid, stadium and mdate for every German goal
SELECT player
	,teamid
	,stadium
	,mdate
FROM goal
JOIN game ON goal.matchid = game.id
WHERE teamid = 'GER'

-- Show the team1, team2 and player for every goal scored by a player called Mario
SELECT team1
	,team2
	,player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE player LIKE 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes
SELECT player
	,teamid
	,coach
	,gtime
FROM goal
JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate
	,teamname
FROM game
JOIN eteam ON game.team1 = eteam.id
WHERE coach LIKE 'Fernando Santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw'

-- Show the name of all players who scored a goal against Germany.
SELECT DISTINCT (player)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE (
		team1 = 'GER'
		OR team2 = 'GER'
		)
	AND teamid != 'GER'

-- Show teamname and the total number of goals scored.
SELECT teamname
	,count(teamid)
FROM eteam
JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname

-- Show the stadium and the number of goals scored in each stadium.
SELECT stadium
	,count(matchid)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid
	,mdate
	,count(matchid) AS goals
FROM game
JOIN goal ON game.id = goal.matchid
WHERE team1 LIKE 'POL'
	OR team2 LIKE 'POL'
GROUP BY matchid
	,mdate

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid
	,mdate
	,count(matchid) AS goals
FROM game
JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY matchid
	,mdate

-- List every match with the goals scored by each team.
SELECT mdate
	,team1
	,sum(CASE
			WHEN teamid = team1
				THEN 1
			ELSE 0
			END) AS score1
	,team2
	,sum(CASE
			WHEN teamid = team2
				THEN 1
			ELSE 0
			END) AS score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY mdate
	,team1
	,team2
ORDER BY mdate
	,matchid
	,team1
	,team2
